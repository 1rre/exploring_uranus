#include <INA219_WE.h>
#include <SD.h>
#include <SPI.h>
#include <Wire.h>

INA219_WE ina219; // this is the instantiation of the library for the current sensor

// set up variables using the SD utility library functions:
Sd2Card card;
SdVolume volume;
SdFile root;

//---------------------------------MPPT_D-VARIABLES----------------------------------------

float open_loop =
    0.2; // This is the duty_cycle_set - VNotes - set initially to 0 for safety reasons
float current_mA;
unsigned int sensorValue0, sensorValue1, sensorValue2,
    sensorValue3; // ADC sample values declaration

boolean RESET = 0;

float Max_Power_Duty,
    Adjusted_Duty; // The duty cycle at MPPT (and the adjusted duty from the DCM avoidance system)
float Max_Power, Inst_Power, Out_Power, P_Trial_1, P_Trial_2, P_Trial_3; // The power at MPPT
boolean Power_Cond_Met = 0, Move_Reset = 0, From_Left = 0, From_Right = 0,
        mppt_finalised =
            0; // VNotes - When that becomes high, that means that a new MPP has been deduced
int Count_Up = 0, Count_Down = 0,
    DCM_A_Count =
        0; // At each trigger loop high (at each if statement iteration) - calculation the number of
long REST_Count = 0;
float V_PV, V_PV_R, I_PV, V_PD_R, V_PD_L, V_PD_OUT, V_OUT, I_OUT;
float Res_Value = 2.2; // This is the value of the (high power rated) resistor used in the input of
                       // the SMPS (MPPT Device) that serves as a current sensing resistor
int count = 0; // VNotes - That is the number of iteration inside the mppt function (when that is
               // ==2 (2 times SL charging SM loop) we impement the next state of mppt and sampling
               // of smppt whereas when ==1 we implement current state mppt next state mppt )
int state_num_mppt = 0, next_state_mppt = 0;

boolean restriction_met = 1;
boolean too_much_current = 0;
boolean negative_current = 0;

float max_current_restriction;
float max_current_three = 1.5;
float max_current_two = 1;
float max_current_one = 0.5;

int nu_operational_cells =
    1; // By default this is set to 3 (assuming that initialy all the cells are operational)
int prev_nu_operational_cells;

float deduced_current_ref, current_current_ref;

unsigned int loopTrigger;   // VNotes used for the interrupt
unsigned int com_count = 0; // a variables to count the interrupts. Used for program debugging.

//---------------------------------CHARGING-VARIABLES---------------------------

const int chipSelect = 10;
unsigned int rest_timer;
unsigned int loop_trigger;
unsigned int int_count = 0; // a variables to count the interrupts. Used for program debugging.
float u0i, u1i, delta_ui, e0i, e1i, e2i;            // Internal values for the current controller
float ui_max = 1, ui_min = 0;                       // anti-windup limitation
float kpi = 0.02512, kii = 39.4, kdi = 0;           // current pid.
float Ts = 0.001;                                   // 1 kHz control frequency.
float current_measure, current_ref = 0, error_amps; // Current Control
float pwm_out;
float V_Bat;
boolean input_switch;
int state_num = 0, next_state,
    total_cycles = 0; // VNotes adding total_cycles measurement for a single cell
String dataString;

boolean cond_met; // VNotes Error exit condition

//---------VNotes Additions for ensuring multiple cell functionality-----------
int current_cell =
    0; // 0 for just the very beginning where the FL will occur once the interrupt occurs
float rest_current;
float V_Cell_1 = 0, V_Cell_2 = 0, V_Cell_3 = 0;
float I_Cell_1 = 0, I_Cell_2 = 0, I_Cell_3 = 0;
float Prev_I_Cell_1 = 0, Prev_I_Cell_2 = 0, Prev_I_Cell_3 = 0;

int state_num_cell_1 = 0, state_num_cell_2 = 0,
    state_num_cell_3 = 0; // The current state of the "s.m. since different implementation than the
                          // reset state machines" of each cell pre-initialized with 0 for the very
                          // beginning (1-->measuring,2-->normal,3-->discharge,4-->error

boolean change_occured = 0; // A change occured in terms of errors
boolean time_for_mppt = 0;
int count_for_mppt; // Responsible for the re-mppt at every number of SL iterations chosen

//---------------------------------SOC-VOLTAGE-LOOK-UP/COULOMB-COUNTING-BALANCING---------------------------

// INDICATING THAT A CELL IS DISCHARGING
bool cell_1_discharging, cell_2_discharging, cell_3_discharging;
bool cell_1_error = 0, cell_2_error = 0,
     cell_3_error = 0; // We assume that all cells start with no error
float cell_1_soc = 0, cell_2_soc = 0, cell_3_soc = 0; // not in %
float cell_1_soh = 1, cell_2_soh = 1,
      cell_3_soh = 1; // assumming that initially all cells had 100% state of health

int Discharge_Pin_Cell_1;
int Discharge_Pin_Cell_2;
int Discharge_Pin_Cell_3;

float total_charge_ref = (500 * 60 * 60) / 1000; // TOTAL BATTERY CHARGE (in A*s)
float threshold_cell_difference = 0.1;           // THIS CAN BE ANYTHING

boolean soc_look_up = 1; // Start with SOC Voltage Table Look Up

unsigned long time_initial_cell_1 = 0, time_final_cell_1 = 0, dt_cell_1 = 0;
unsigned long time_initial_cell_2 = 0, time_final_cell_2 = 0, dt_cell_2 = 0;
unsigned long time_initial_cell_3 = 0, time_final_cell_3 = 0, dt_cell_3 = 0;

unsigned long initial_sample_nu;
unsigned long final_sample_nu;
unsigned long samples_difference;
float calculate;
float a = 0, b = 0;

int soc_int_1, soc_int_2,
    soc_int_3; // used to print the socs percentages as an ints and not a floats
int soh_int_1, soh_int_2,
    soh_int_3; // used to print the sohs percentages as an ints and not a floats

//----------------------------For-SOH-Deduction-------------------------------
int cell_that_terminated = 0; // Used by terminator to be checked first logic
float soh_error_threshold =
    0.70; // The SOH must be at least 0.8 for the cell to be declared as a cell with low soh

//----------------------------Communication-------------------------------
byte char_0, char_1, char_2, char_3, char_4, char_5, char_6, char_7; // bytes to be sent at control
byte dummy_bit_0, dummy_bit_1, dummy_bit_2, dummy_bit_3, dummy_bit_4, dummy_bit_5, dummy_bit_6,
    dummy_bit_7;
//--------------------------------------------------------------------------------------

void setup() {

  prev_nu_operational_cells = nu_operational_cells; // Initialization for the very first time

  // Some General Setup Stuff

  Wire.begin();          // We need this for the i2c comms for the current sensor
  Wire.setClock(700000); // set the comms speed for i2c
  ina219.init();         // this initiates the current sensor
  Serial.begin(9600);    // USB Communications
  Serial1.begin(9600);   // USB Communications

  // Check for the SD Card
  Serial.println("\nInitializing SD card...");
  if (!SD.begin(chipSelect)) {
    Serial.println("* is a card inserted?");
    while (true) {
    } // It will stick here FOREVER if no SD is in on boot
  } else {
    Serial.println("Wiring is correct and a card is present.");
  }

  if (SD.exists("BatCycle.csv")) { // Wipe the datalog when starting
    SD.remove("BatCycle.csv");
  }

  noInterrupts();            // disable all interrupts
  analogReference(EXTERNAL); // We are using an external analogue reference for the ADC

  // SMPS Pins
  pinMode(13, OUTPUT);      // Using the LED on Pin D13 to indicate status
  pinMode(2, INPUT_PULLUP); // Pin 2 is the input from the CL/OL switch
  pinMode(6, OUTPUT);       // This is the PWM Pin

  // LEDs on pin 7 and 8
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(4, OUTPUT); // VNotes additional Dark Green LED
  pinMode(5, OUTPUT); // VNotea additional Blue LED

  // VNotes Battery Ports
  pinMode(3, OUTPUT);  // VNotes Meas RELAY port - Cell 1
  pinMode(9, OUTPUT);  // VNotes Meas RELAY port - Cell 2
  pinMode(21, OUTPUT); // VNotes Meas RELAY port - Cell 3

  pinMode(Discharge_Pin_Cell_1, OUTPUT); // VNotes Discharge port - Cell 1
  pinMode(Discharge_Pin_Cell_2, OUTPUT); // VNotes Discharge port - Cell 2
  pinMode(Discharge_Pin_Cell_3, OUTPUT); // VNotes Discharge port - Cell 3

  // Analogue input, the battery voltage (also port B voltage)
  pinMode(A0, INPUT); // OL Voltage - Cell 1
  pinMode(A1, INPUT); // OL Voltage - Cell 2
  pinMode(A6, INPUT); // OL Voltage - Cell 3

  //----------------ADDITIONAL FOR MPPT_D SETUP----------------------
  pinMode(A2, INPUT); // MPPT_D V_PD_L
  // pinMode(A3, INPUT); //MPPT_D V_PD_R
  // pinMode(A7, INPUT); //MPPT_D V_OUT
  //---------------------------------------------------------------

  // TimerA0 initialization for 1kHz control-loop interrupt.
  TCA0.SINGLE.PER =
      999; // VNotes Change (from 999 to 9999) Thus 100Hz from 1kHz (from T=1ms to T=0.01s)
  TCA0.SINGLE.CMP1 = 999;                                                // VNotes -//-
  TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV16_gc | TCA_SINGLE_ENABLE_bm; // 16 prescaler, 1M.
  TCA0.SINGLE.INTCTRL = TCA_SINGLE_CMP1_bm;

  // TimerB0 initialization for PWM output
  TCB0.CTRLA = TCB_CLKSEL_CLKDIV1_gc | TCB_ENABLE_bm; // 62.5kHz

  interrupts();        // enable interrupts.
  analogWrite(6, 120); // just a default state to start with
}

void loop() {

  if (loop_trigger == 1) { // FAST LOOP (1kHz) - VNotes f=100Hz | T=0.01s

    state_num = next_state; // state transition

    Serial.println("------------------------------Charging/Cells State Machines "
                   "Status----------------------------------------");
    Serial.print("(Charging State Machine): The Current State Is: ");
    Serial.println(state_num);

    Serial.print("Cell 1 State: ");
    Serial.print(state_num_cell_1);
    Serial.print(" Cell 2 State: ");
    Serial.print(state_num_cell_2);
    Serial.print(" Cell 3 State: ");
    Serial.println(state_num_cell_3);

    Serial.print("Cell 1 Discharge: ");
    Serial.print(cell_1_discharging);
    Serial.print(" Cell 2 Discharge: ");
    Serial.print(cell_2_discharging);
    Serial.print(" Cell 3 Discharge: ");
    Serial.println(cell_3_discharging);

    Serial.print("Cell 1 Error: ");
    Serial.print(cell_1_error);
    Serial.print(" Cell 2 Error: ");
    Serial.print(cell_2_error);
    Serial.print(" Cell 3 Error: ");
    Serial.println(cell_3_error);

    //----------------------SOCS-PRINTING-------------------------

    Serial.print("Cell 1 SOC in %: ");
    soc_int_1 = cell_1_soc * 100;
    Serial.print(soc_int_1);

    Serial.print(" Cell 2 SOC in %: ");
    soc_int_2 = cell_2_soc * 100;
    Serial.print(soc_int_2);

    Serial.print(" Cell 3 SOC in %: ");
    soc_int_3 = cell_3_soc * 100;
    Serial.println(soc_int_3);

    //----------------------SOHS-PRINTING-------------------------

    Serial.print("Cell 1 SOH in %: ");
    soh_int_1 = cell_1_soh * 100;
    Serial.print(soh_int_1);

    Serial.print(" Cell 2 SOH in %: ");
    soh_int_2 = cell_2_soh * 100;
    Serial.print(soh_int_2);

    Serial.print(" Cell 3 SOH in %: ");
    soh_int_3 = cell_3_soh * 100;
    Serial.println(soh_int_3);

    //---------------------------------------------------------
    Serial.print("Int Count Value: ");
    Serial.println(int_count);

    //-----------------------------COMMS----------------------------------------------

    if (cell_1_error == 1) {
      dummy_bit_0 = B00000001;
    } else {
      dummy_bit_0 = B00000000;
    }

    if (cell_1_discharging == 1) {
      dummy_bit_1 = B00000010;
    } else {
      dummy_bit_1 = B00000000;
    }

    //------

    if (cell_2_error == 1) {
      dummy_bit_2 = B00000100;
    } else {
      dummy_bit_2 = B00000000;
    }

    if (cell_2_discharging == 1) {
      dummy_bit_3 = B00001000;
    } else {
      dummy_bit_3 = B00000000;
    }

    //-----

    if (cell_3_error == 1) {
      dummy_bit_4 = B00010000;
    } else {
      dummy_bit_4 = B00000000;
    }

    if (cell_3_discharging == 1) {
      dummy_bit_5 = B00100000;
    } else {
      dummy_bit_5 = B00000000;
    }

    char_0 = dummy_bit_0 | dummy_bit_1 | dummy_bit_2 | dummy_bit_3 | dummy_bit_4 |
             dummy_bit_5; // Bitwise or

    char_1 = soc_int_1;

    char_2 = soc_int_2;

    char_3 = soc_int_3;

    char_4 = soh_int_1;

    char_5 = soh_int_2;

    char_6 = soh_int_3;

    // all the states sent for all state machines will be for the very current moment that we send
    // them
    if (state_num_mppt == 0) {
      dummy_bit_0 = B00000000;
    } else if (state_num_mppt == 1) {
      dummy_bit_0 = B00000001;
    } else if (state_num_mppt == 2) {
      dummy_bit_0 = B00000010;
    } else if (state_num_mppt == 3) {
      dummy_bit_0 = B00000011;
    } else if (state_num_mppt == 4) {
      dummy_bit_0 = B00000100;
    } else if (state_num_mppt == 5) {
      dummy_bit_0 = B00000101;
    }

    //-------------------------

    if (state_num == 0) {
      dummy_bit_1 = B00000000;
    } else if (state_num == 1) {
      dummy_bit_1 = B00010000;
    } else if (state_num == 2) {
      dummy_bit_1 = B00100000;
    } else if (state_num == 3) {
      dummy_bit_1 = B00110000;
    } else if (state_num == 4) {
      dummy_bit_1 = B01000000;
    } else if (state_num == 5) {
      dummy_bit_1 = B01010000;
    } else if (state_num == 6) {
      dummy_bit_1 = B01100000;
    }

    char_7 = dummy_bit_0 | dummy_bit_1; // Bitwise or

    // Sending the data to control

    Serial1.write(char_0);
    Serial1.write(char_1);
    Serial1.write(char_2);
    Serial1.write(char_3);
    Serial1.write(char_4);
    Serial1.write(char_5);
    Serial1.write(char_6);
    Serial1.write(char_7);

    //-------------------------------------------------------------------------------

    // That if is only useful for the very first iteration of the FL, for all the other times else
    // will be used

    if (current_cell ==
        0) { // Think of it as the very beginning of the measurements (when we initally run the
             // code) - Because of this the very first dt_cell_1 calculated for the very first two
             // measurements wont be accurate! (considering that the first time of the next one wont
             // be accurate as well) - Fixed!
      total_current_measure(); // To obtain measurements in case we are always in the errr state.
      digitalWrite(3, HIGH);   // VNotes sets the relay of cell 1 high
      Serial.println("Measure OL Voltage Port Cell 1 High");
      current_cell = 1;     // Start with the first cell
      state_num_cell_1 = 1; // Indicating that we are currently measuring cell 1
    }

    else {
      if (state_num != 6) { // To make sure that we won't go in here if we are in the MPPT state

        Serial.println("-------------------------Current Cell Measurement "
                       "Status----------------------------------");

        Serial.print("Measurement of Cell: ");
        Serial.print(current_cell);
        Serial.println(" occurs");

        if (current_cell == 1) {
          V_Cell_1 = analogRead(A0) * 4.096 /
                     1.035; // check the battery voltage (1.03 is a correction for measurement
                            // error, you need to check this works for you) //VNotes tuned to 1.035
                            // (With use of battery PCB nu=1)
          V_Bat = V_Cell_1;
          if ((V_Cell_1 > 3700 || V_Cell_1 < 2400) ||
              cell_1_soh < 0.7) { // Checking for Error in the cell
            cell_1_error = 1;     // Indicate that cell 1 has an error
          } else {                // VNotes else for error exit condition
            cell_1_error = 0;     // Indicate that we remain/(or go - exit error state) to measuring
                              // state (of cell s.m.)
          }
        }

        if (current_cell == 2) {
          V_Cell_2 = analogRead(A1) * 4.096 /
                     1.035; // check the battery voltage (1.03 is a correction for measurement
                            // error, you need to check this works for you) //VNotes tuned to 1.035
                            // (With use of battery PCB nu=1)
          if ((V_Cell_2 > 3700 || V_Cell_2 < 2400) ||
              cell_2_soh < 0.7) { // Checking for Error in the cell
            cell_2_error = 1;     // Indicate that cell 1 has an error
          } else {                // VNotes else for error exit condition
            cell_2_error = 0;     // Indicate that we remain/(or go - exit error state) to measuring
                              // state (of cell s.m.)
          }
        }

        if (current_cell == 3) {
          V_Cell_3 = analogRead(A6) * 4.096 /
                     1.035; // check the battery voltage (1.03 is a correction for measurement
                            // error, you need to check this works for you) //VNotes tuned to 1.035
                            // (With use of battery PCB nu=1)
          if ((V_Cell_3 > 3700 || V_Cell_3 < 2400) ||
              cell_3_soh < 0.7) { // Checking for Error in the cell
            cell_3_error = 1;     // Indicate that cell 1 has an error
          } else {                // VNotes else for error exit condition
            cell_3_error = 0;     // Indicate that we remain/(or go - exit error state) to measuring
                              // state (of cell s.m.)
          }
        }

        //------------------------- COMPLETE ERROR-CHECKING & OPEATIONAL CELLS DEDUCTION & CHANGE
        //OCCURED MONITORING--------------------------------

        if (cell_1_error == 1 || cell_2_error == 1 ||
            cell_3_error == 1) { // If we have at least one error
          nu_operational_cells = 2;

          if ((cell_1_error == 1 && cell_2_error == 1) ||
              (cell_2_error == 1 && cell_3_error == 1) ||
              (cell_1_error == 1 && cell_3_error == 1)) { // If we have at least a pair of error
            nu_operational_cells = 1;
          }

          if (cell_1_error == 1 && cell_2_error == 1 &&
              cell_3_error == 1) { // Checking for Error states (just battery voltage for now)
            nu_operational_cells = 0;

            state_num = 5;          // go directly to jail
            next_state = 5;         // stay in jail
            digitalWrite(7, true);  // turn on the red LED
            digitalWrite(4, false); // VNotes avoiding red with other colors
            digitalWrite(8, false); // VNotes avoiding red with other colors
            digitalWrite(5, false); // VNotes avoiding red with other colors
            cond_met = 0;           // VNotes condition that the we are NOT in error
            current_ref = 0;        // no current
          } else {                  // VNotes else for error exit condition
            cond_met = 1;           // VNotes error exit condition
          }
        }

        else { // If we do not have a single error
          nu_operational_cells = 3;
        }

        if (nu_operational_cells != prev_nu_operational_cells) {
          change_occured = 1; // Indicates that there was a change in the number of operational
                              // cells
          Serial.print("The number of operational cells was changed from: ");
          Serial.print(prev_nu_operational_cells);
          Serial.print(" to ");
          Serial.println(nu_operational_cells);
        }
        prev_nu_operational_cells =
            nu_operational_cells; // Set the previous number of operational cells=current number of
                                  // operational cells
        //-----------------------------------------------------------------------

        rest_current_measure(); // Measure the current obtained from the rest cells (the one
                                // measured is like it was disconnected)

        if (current_cell == 1) {
          digitalWrite(3, LOW);
          Serial.println("Measure OL Voltage Port Cell 1 Low - Measurement 1 Terminated");

          state_num_cell_1 = 2; // Make the cell 1 be in normal state

          time_final_cell_1 = millis();
          total_current_measure(); // The total current will be measured here where all the relays
                                   // are low
          dt_cell_1 = time_final_cell_1 -
                      time_initial_cell_1; // The dt used here will serve as an ~ of the time
                                           // interval passed from the past current measurement
                                           // (durrent current == measurements) to the present
                                           // (actually the total_current measurement but it will be
                                           // precise enough) - (will be used in coulomb counting)
          time_initial_cell_1 = millis();

          Prev_I_Cell_1 = I_Cell_1; // Store the previous I_Cell_1 that we had (will be used in
                                    // Coulomb Counting)
          I_Cell_1 = current_measure - rest_current;

          Serial.print("OL Voltage of Cell 1 is: ");
          Serial.println(V_Cell_1);
          Serial.print("Current of Cell 1 is: ");
          Serial.println(I_Cell_1);

          Serial.print("Current Ref: ");
          Serial.println(current_ref);
          Serial.print("Actual Current: ");
          Serial.println(current_measure);
          Serial.print("Rest Currrent: ");
          Serial.println(rest_current);

          Serial.println("-------------------------------------------------------------------------"
                         "-----------------");

          current_cell = 2; // Initiate Cell 3 measurement
          digitalWrite(9, HIGH);
          Serial.println("Measure OL Voltage Port Cell 2 High");
          state_num_cell_2 = 1; // Make the cell 2 be in measure state
        }

        else if (current_cell == 2) {
          digitalWrite(9, LOW);
          Serial.println("Measure OL Voltage Port Cell 2 Low - Measurement 2 Terminated");

          state_num_cell_2 = 2; // Make the cell 2 be in normal state

          time_final_cell_2 = millis();
          total_current_measure(); // The total current will be measured here where all the relays
                                   // are low
          dt_cell_2 = time_final_cell_2 - time_initial_cell_2;
          time_initial_cell_2 = millis();

          Prev_I_Cell_2 = I_Cell_2; // Store the previous I_Cell_2 that we had (will be used in
                                    // Coulomb Counting)
          I_Cell_2 = current_measure - rest_current;

          Serial.print("OL Voltage of Cell 2 is: ");
          Serial.println(V_Cell_2);
          Serial.print("Current of Cell 2 is: ");
          Serial.println(I_Cell_2);

          Serial.print("Current Ref: ");
          Serial.println(current_ref);
          Serial.print("Actual Current: ");
          Serial.println(current_measure);
          Serial.print("Rest Currrent: ");
          Serial.println(rest_current);

          Serial.println("-------------------------------------------------------------------------"
                         "-----------------");

          current_cell = 3; // Initiate Cell 3 measurement
          digitalWrite(21, HIGH);
          Serial.println("Measure OL Voltage Port Cell 3 High");
          state_num_cell_3 = 1; // Make the cell 3 be in measure state
        }

        else if (current_cell == 3) {
          digitalWrite(21, LOW);
          Serial.println("Measure OL Voltage Port Cell 3 Low - Measurement 3 Terminated");

          state_num_cell_3 = 2; // Make the cell 3 be in normal state

          time_final_cell_3 = millis();
          total_current_measure(); // The total current will be measured here where all the relays
                                   // are low
          dt_cell_3 = time_final_cell_3 - time_initial_cell_3;
          time_initial_cell_3 = millis();

          Prev_I_Cell_3 = I_Cell_3; // Store the previous I_Cell_3 that we had (will be used in
                                    // Coulomb Counting)
          I_Cell_3 = current_measure - rest_current;

          Serial.print("OL Voltage of Cell 3 is: ");
          Serial.println(V_Cell_3);
          Serial.print("Current of Cell 3 is: ");
          Serial.println(I_Cell_3);

          Serial.print("Current Ref: ");
          Serial.println(current_ref);
          Serial.print("Actual Current: ");
          Serial.println(current_measure);
          Serial.print("Rest Currrent: ");
          Serial.println(rest_current);

          Serial.println("-------------------------------------------------------------------------"
                         "-----------------");

          current_cell = 1; // Initiate Cell 1 measurement
          digitalWrite(3, HIGH);
          Serial.println("Measure OL Voltage Port Cell 1 High");
          state_num_cell_1 = 1; // Make the cell 1 be in measure state
        }                       // Else if end
      }                         // If state num!=6 end
      int_count++;      // count how many interrupts since this was last reset to zero (end of SL)
      count_for_mppt++; // count how many interrupts since this was last reset to zero (once we set
                        // the )
    } // Else not very very first time end
  }   // Fast loop end

  if (count_for_mppt == 500) {
    count_for_mppt = 0; // reset the counter
    time_for_mppt = 1;  // Indicates its time for a new mppt
  }

  if (int_count ==
      4) { // SLOW LOOP (1Hz) //VNotes changed count to 100 ensuring 1Hz | T=1s instead of 10s //Was
           // set to 4 to allow at least! measuring each cell 1 time every time
    input_switch =
        !digitalRead(2); // get the OL/CL switch status (we want to make sure that when
                         // input_switch==1 we will have RESET=1 otherwise we will have RESET=0)
    switch (state_num) { // STATE MACHINE (see diagram)
    case 0: {            // Start state (no current, no LEDs) //VNotes Dark Green
      current_ref = 0;
      digitalWrite(4, true);   // VNotes
      if (input_switch == 1) { // if switch, move to mppt_in_charging_sm_state
        next_state = 6;
        digitalWrite(8, true); // During mppt_d turn orange also on
        // digitalWrite(4,false); //VNotes
      } else { // otherwise stay put
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
      }
      break;
    }
    case 1: { // Charge state (250mA and a green LED)
      current_ref = current_current_ref;

      if (soc_look_up == 1) { // Only for the first time we get into charging state machine state 1,
                              // we will deduce the soc of each cell using voltage lookup
        cell_1_soc = find_soc_look_up_cell_1(V_Cell_1);
        // Serial.print("Look Up Voltage For Cell 1 Found: ");
        // Serial.print(cell_1_soc);
        cell_2_soc = find_soc_look_up_cell_2(V_Cell_2);
        // Serial.print("Look Up Voltage For Cell 1 Found: ");
        // Serial.print(cell_1_soc);
        cell_3_soc = find_soc_look_up_cell_3(V_Cell_3);
        // Serial.print("Look Up Voltage For Cell 1 Found: ");
        // Serial.print(cell_1_soc);

        soc_look_up = 0; // set it to zero such that we will continue with Coulomb counting (only
                         // the mppt state of charging state machine resets it to 1)
      } else { // Afterwards continue with Coulomb counting
        cell_1_soc = soc_coulomb_counting(dt_cell_1, Prev_I_Cell_1, cell_1_soc);
        cell_2_soc = soc_coulomb_counting(dt_cell_2, Prev_I_Cell_2, cell_2_soc);
        cell_3_soc = soc_coulomb_counting(dt_cell_3, Prev_I_Cell_3, cell_3_soc);
      }

      cell_balancing(cell_1_soc, cell_2_soc, cell_3_soc);

      if ((V_Cell_1 >= 3600 && cell_1_error != 1) || (V_Cell_2 >= 3600 && cell_1_error != 1) ||
          (V_Cell_3 >= 3600 &&
              cell_1_error !=
                  1)) { // if charged, go to charge rest //make sure you do not implement any
                        // decision based on the voltage of a cell with error
        next_state = 2;

        if (V_Cell_1 >= 3600 && cell_1_error != 1) {
          cell_that_terminated = 1;
        } else if (V_Cell_2 >= 3600 && cell_2_error != 1) {
          cell_that_terminated = 2;
        } else if (V_Cell_3 >= 3600 && cell_3_error != 1) {
          cell_that_terminated = 3;
        }

        Serial.print("The termination occured from cell: ");
        Serial.println(cell_that_terminated);

        digitalWrite(8, false);
        digitalWrite(5, true); // VNotes
      } else {                 // otherwise stay put
        next_state = 1;
        digitalWrite(8, true);
        digitalWrite(5, false); // VNotes
      }
      if (input_switch == 0) { // UNLESS the switch = 0, then go back to start
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
      } else if (change_occured == 1 |
                 time_for_mppt ==
                     1) { // While being in charging state in the charging state machine, either of
                          // these conditions, if it's high, will make next_state (charging sm)=6
                          // such that we will move to mppt
        next_state = 6;
        digitalWrite(4, true); // Turn Dark Green LED also on
        digitalWrite(8, true); // Keep orange LED on
      }
      break;
    }
    case 2: { // Charge Rest, green LED is off and no current //VNotes Blue

      balancing_off(); // Turn off all the dischargers from all the cells (actually think of it as
                       // make sure that all or off)

      // Here the sohs will be updated and checked

      if (cell_that_terminated == 1) { // No need to recheck whether the cell has an error since
                                       // that has already been checked from before
        cell_1_soh = cell_1_soc;

        if (cell_1_soh < soh_error_threshold) {
          Serial.print("The cell: ");
          Serial.print(cell_that_terminated);
          Serial.print("has low state of health. Placing it into error");
          cell_1_error = 1;
        } else {
          cell_2_soh = cell_2_soc;
          cell_3_soh = cell_3_soc;
        }
      }

      else if (cell_that_terminated == 2) { // No need to recheck whether the cell has an error
                                            // since that has already been checked from before
        cell_2_soh = cell_2_soc;

        if (cell_2_soh < soh_error_threshold) {
          Serial.print("The cell: ");
          Serial.print(cell_that_terminated);
          Serial.print("has low state of health. Placing it into error");
          cell_1_error = 2;
        } else {
          cell_1_soh = cell_1_soc;
          cell_3_soh = cell_3_soc;
        }
      }

      else if (cell_that_terminated == 3) { // No need to recheck whether the cell has an error
                                            // since that has already been checked from before
        cell_3_soh = cell_3_soc;

        if (cell_3_soh < soh_error_threshold) {
          Serial.print("The cell: ");
          Serial.print(cell_that_terminated);
          Serial.print("has low state of health. Placing it into error");
          cell_3_error = 1;
        } else {
          cell_1_soh = cell_1_soc;
          cell_2_soh = cell_2_soc;
        }
      }

      // Since the current_ref is 0 we assume that the socs do not change
      current_ref = 0;
      if (rest_timer < 30) { // Stay here if timer < 30
        next_state = 2;
        digitalWrite(8, false);
        digitalWrite(5, true); // VNotes
        rest_timer++;
      } else { // Or move to discharge (and reset the timer)
        next_state = 3;
        // digitalWrite(8,false);
        digitalWrite(8, true);  // VNotes
        digitalWrite(7, true);  // VNotes
        digitalWrite(5, false); // VNotes
        rest_timer = 0;
      }
      if (input_switch == 0) { // UNLESS the switch = 0, then go back to start
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
      }
      break;
    }
    case 3: { // Discharge state //VNotes both red and green (light) on.

      // During discharge we will keep using only Coulomb counting for monitoring the socs
      cell_1_soc = soc_coulomb_counting(dt_cell_1, Prev_I_Cell_1, cell_1_soc);
      cell_2_soc = soc_coulomb_counting(dt_cell_2, Prev_I_Cell_2, cell_2_soc);
      cell_3_soc = soc_coulomb_counting(dt_cell_3, Prev_I_Cell_3, cell_3_soc);

      if (nu_operational_cells == 3) {
        current_ref = -1500;
      }
      if (nu_operational_cells == 2) {
        current_ref = -1000;
      }
      if (nu_operational_cells == 1) {
        current_ref = -500;
      }

      if ((V_Cell_1 <= 2500 && cell_1_error != 1) || (V_Cell_2 <= 2500 && cell_1_error != 1) ||
          (V_Cell_3 <= 2500 &&
              cell_1_error !=
                  1)) { // if discharged, go to discharge rest //make sure you do not implement any
                        // decision based on the voltage of a cell with error
        next_state = 4;
        digitalWrite(8, false); // VNotes
        digitalWrite(7, false); // VNotes
        digitalWrite(5, true);  // VNotes
      } else {                  // If not discharged, stay put
        next_state = 3;
        digitalWrite(8, false);
        digitalWrite(7, false); // VNotes

        // total_cycles=total_cycles+1; //VNotes Addition to measure the number of the total cycles
      }
      if (input_switch == 0) { // UNLESS the switch = 0, then go back to start
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
      }
      break;
    }
    case 4: { // Discharge rest, no LEDs no current //VNotes Blue on
      current_ref = 0;
      if (rest_timer < 30) { // Rest here for 30s like before
        next_state = 4;
        digitalWrite(8, false);
        digitalWrite(5, true); // VNotes
        rest_timer++;
      } else { // When thats done, move back to charging (and light the green LED)
        next_state = 1;
        digitalWrite(8, true);
        digitalWrite(5, false); // VNotes
        rest_timer = 0;
      }
      if (input_switch == 0) { // UNLESS the switch = 0, then go back to start
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
      }
      break;
    }
    case 5: { // ERROR state RED led and no current
      current_ref = 0;
      next_state = 5; // Always stay here
      digitalWrite(7, true);
      digitalWrite(8, false);
      if (input_switch == 0 ||
          cond_met ==
              1) { // UNLESS the switch = 0, then go back to start //VNotes Error exit capability
        next_state = 0;
        digitalWrite(7, false);
        digitalWrite(4, true); // VNotes turn dark green when changing from error to start
      }
      break;
    }
    case 6: { // MPPT STATE

      soc_look_up = 1; // Re-initialize voltage lookup for cells socs for the very first time we get
                       // into charging state machine charging (1) state

      digitalWrite(4, true); // DARK GREEN (HIGH)
      digitalWrite(8, true); // GREEN (YELLOW - HIGH)

      if (mppt_finalised == 0) {

        //-------For the charging state machine-----------------------------------
        current_ref = 0;
        next_state = 6; // remain in the mppt state until the current ref is deduced (mmpt_finalised
                        // becomes high)
        //---------------------------------------

        digitalWrite(3, LOW); // Turn of all relays to accurately measure V_OUT
        digitalWrite(9, LOW);
        digitalWrite(21, LOW);

        state_num_cell_1 = 2; // Make the cell 1 be in normal state
        state_num_cell_2 = 2; // Make the cell 2 be in normal state
        state_num_cell_3 = 2; // Make the cell 1 be in normal state

        //---------------------MPPT_CODE----------------------------------------

        mppt_function();

        //----------------------------------------------------------------------

      }

      else {

        Serial.println("MPPT Finalized!");

        //-------For the charging state machine----------------------
        current_current_ref =
            deduced_current_ref *
            1000; // Update the current current ref with the new deduced current ref from the mppt
                  // (*1000 to turn the A used in mppt_d to mA used by the charging sm)
        next_state = 1; // regardless if we went to mppt state from reset or charging we will go to
                        // charging state (1)
        mppt_finalised = 0;     // Reset the variable again to 0
        digitalWrite(4, false); // DARK GREEN (LOW)
        digitalWrite(8, true);  // GREEN (HIGH)
        //---------------------------------------

        // RESET the relays (start again with the first one)
        count = count + 1;
        digitalWrite(3, HIGH); // VNotes sets the relay of cell 1 high
        Serial.println("Measure OL Voltage Port Cell 1 High");
        current_cell = 1;     // Start with the first cell
        state_num_cell_1 = 1; // Make the cell 1 be in measure state
      }
      if (input_switch == 0) { // UNLESS the switch = 0, then go back to start
        next_state = 0;
        digitalWrite(8, false);
        digitalWrite(4, true); // VNotes
        // REST the relays
        digitalWrite(3, HIGH); // VNotes sets the relay of cell 1 high
        Serial.println("Measure OL Voltage Port Cell 1 High");
        current_cell = 1;     // Start with the first cell
        state_num_cell_1 = 1; // Make the cell 1 be in measure state
      }
      break;
    }

    default: { // Should not end up here ....
      Serial.println("Boop");
      current_ref = 0;
      next_state = 5; // So if we are here, we go to error
      digitalWrite(7, true);
    }
    }

    dataString = String(state_num) + "," + String(V_Cell_1) + "," + String(V_Cell_2) + "," +
                 String(V_Cell_3) + "," + String(current_ref) + "," +
                 String(current_measure); // build a datastring for the CSV file
    // Serial.println(dataString); // send it to serial as well in case a computer is connected
    File dataFile = SD.open("BatCycle.csv", FILE_WRITE); // open our CSV file
    if (dataFile) {                 // If we succeeded (usually this fails if the SD card is out)
      dataFile.println(dataString); // print the data
    } else {
      Serial.println("File not open"); // otherwise print an error
    }
    dataFile.close(); // close the file

    // RESET Charging state machine variables
    int_count = 0;      // reset the interrupt count so we dont come back here for 1000ms
    change_occured = 0; // reset the change occured
    time_for_mppt = 0;

  } // Slow loop end
} //

// Timer A CMP1 interrupt. Every 1000us the program enters this interrupt. This is the fast 1kHz
// loop
ISR(TCA0_CMP1_vect) {
  loop_trigger = 1;                           // trigger the loop when we are back in normal flow
  TCA0.SINGLE.INTFLAGS |= TCA_SINGLE_CMP1_bm; // clear interrupt flag
  // Serial.println("INTERRUPT OCCURS!!");
}

//-------------------------------------------Functions_Used_By_Charging_Only------------------------------------------------

float pidi(float pid_input) { // discrete PID function
  float e_integration;
  e0i = pid_input;
  e_integration = e0i;

  // anti-windup
  if (u1i >= ui_max) {
    e_integration = 0;
  } else if (u1i <= ui_min) {
    e_integration = 0;
  }

  delta_ui = kpi * (e0i - e1i) + kii * Ts * e_integration +
             kdi / Ts * (e0i - 2 * e1i + e2i); // incremental PID programming avoids integrations.
  u0i = u1i + delta_ui;                        // this time's control output

  // output limitation
  saturation(u0i, ui_max, ui_min);

  u1i = u0i; // update last time's control output
  e2i = e1i; // update last last time's error
  e1i = e0i; // update last time's error
  return u0i;
}

void total_current_measure() {
  current_measure = (ina219.getCurrent_mA()); // sample the inductor current (via the sensor chip)
  // current_measure=current_measure/1000; //Make it A from mA
  error_amps = (current_ref - current_measure) / 1000; // PID error calculation
  pwm_out = pidi(error_amps);                          // Perform the PID controller calculation
  pwm_out = saturation(pwm_out, 0.99, 0.01);           // duty_cycle saturation
  analogWrite(6, (int)(255 - pwm_out * 255));          // write it out (inverting for the Buck here)
  loop_trigger = 0;                                    // reset the trigger and move on with life
}

void rest_current_measure() {
  rest_current = (ina219.getCurrent_mA()); // sample the inductor current (via the sensor chip)
                                           // rest_current=rest_current/1000; //Make it A from mA
}

float find_soc_look_up_cell_1(float V_Cell_1) {

  initial_sample_nu = 11613;
  final_sample_nu = 19410;
  samples_difference = final_sample_nu - initial_sample_nu;

  if (V_Cell_1 > 3600) {
    return 1;
  } else if (V_Cell_1 > 3539) {
    a = 3.14;
    b = 8085.50;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 3472) {
    a = 9.84;
    b = -15606.68;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 3436) {
    a = 45.77;
    b = -140342.37;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 3376) {
    a = 52.37;
    b = -163034.24;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 3297) {
    a = 19.3;
    b = -51373.87;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 3090) {
    a = 2.27;
    b = 4753.82;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_1 > 2500) {
    a = 0.28;
    b = 10904.21;
    return (linear_calc(a, b, V_Cell_1) - initial_sample_nu) / samples_difference;
  }

  else
    return 0;
}

float find_soc_look_up_cell_2(float V_Cell_2) {

  initial_sample_nu = 8642;
  final_sample_nu = 16221;
  samples_difference = final_sample_nu - initial_sample_nu;

  if (V_Cell_2 > 3600) {
    return 1;
  } else if (V_Cell_2 > 3503) {
    a = 5.73;
    b = -4373.17;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 3460) {
    a = 66.16;
    b = -216105.52;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 3412) {
    a = 45.68;
    b = -143068.37;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 3388) {
    a = 80.30;
    b = -261187.41;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 3301) {
    a = 20.28;
    b = -58510.24;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 3146) {
    a = 2.21;
    b = 1816.48;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_2 > 2500) {
    a = 0.17;
    b = 8214.34;
    return (linear_calc(a, b, V_Cell_2) - initial_sample_nu) / samples_difference;
  }

  else
    return 0;
}

float find_soc_look_up_cell_3(float V_Cell_3) {

  initial_sample_nu = 11618;
  final_sample_nu = 19397;
  samples_difference = final_sample_nu - initial_sample_nu;

  if (V_Cell_3 > 3600) {
    return 1;
  } else if (V_Cell_3 > 3523) {
    a = 3.68;
    b = 6154.15;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 3480) {
    a = 10.47;
    b = -17765.55;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 3436) {
    a = 41.06;
    b = -124214.62;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 3400) {
    a = 52.17;
    b = -162368.56;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 3380) {
    a = 57.37;
    b = -180049.32;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 3289) {
    a = 18.66;
    b = -49230.52;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 2998) {
    a = 1.53;
    b = 7108.72;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  } else if (V_Cell_3 > 2500) {
    a = 0.17;
    b = 11188.48;
    return (linear_calc(a, b, V_Cell_3) - initial_sample_nu) / samples_difference;
  }

  else
    return 0;
}

float linear_calc(float a, float b, float V) {
  calculate = a * V + b; // Of the form y=ax+b, where x is the OL voltage of the cell
  return calculate;
}

float soc_coulomb_counting(long dt, float prev_current, float current_soc) {
  // dt is in ms and current and prev current is the current just before the new measurement in mA
  float dq = (prev_current * dt) / (1000 * 1000);
  float dsoc = dq / total_charge_ref;
  current_soc = current_soc + dsoc;
  return current_soc;
}

void cell_balancing(float cell_1_soc, float cell_2_soc,
    float cell_3_soc) { // we have to make sure that we are not turning discharge on on a cell with
                        // error

  if (((cell_1_soc - cell_2_soc > threshold_cell_difference) && cell_1_error != 1 &&
          cell_2_error != 1) ||
      ((cell_1_soc - cell_3_soc > threshold_cell_difference) && cell_1_error != 1 &&
          cell_3_error != 1)) {
    // put cell 1 in discharge=ing state
    cell_1_discharging = 1;
    digitalWrite(Discharge_Pin_Cell_1, HIGH);

  } else if (cell_1_discharging == 1) {
    // put cell 1 in charging state
    cell_1_discharging = 0;
    digitalWrite(Discharge_Pin_Cell_1, LOW);
  }

  if (((cell_2_soc - cell_1_soc > threshold_cell_difference) && cell_2_error != 1 &&
          cell_1_error != 1) ||
      ((cell_2_soc - cell_3_soc > threshold_cell_difference) && cell_2_error != 1 &&
          cell_3_error != 1)) {
    // put cell 2 in discharge=ing state
    cell_2_discharging = 1;
    digitalWrite(Discharge_Pin_Cell_2, HIGH);

  } else if (cell_2_discharging == 1) {
    // put cell 2 in charging state
    cell_2_discharging = 0;
    digitalWrite(Discharge_Pin_Cell_2, LOW);
  }

  if (((cell_3_soc - cell_2_soc > threshold_cell_difference) && cell_3_error != 1 &&
          cell_2_error != 1) ||
      ((cell_3_soc - cell_1_soc > threshold_cell_difference) && cell_3_error != 1 &&
          cell_1_error != 1)) {
    // put cell 3 in discharge=ing state
    cell_3_discharging = 1;
    digitalWrite(Discharge_Pin_Cell_3, HIGH);

  } else if (cell_3_discharging == 1) {
    // put cell 1 in charging state
    cell_3_discharging = 0;
    digitalWrite(Discharge_Pin_Cell_3, LOW);
  }
}

void balancing_off() {
  cell_1_discharging = 0;
  digitalWrite(Discharge_Pin_Cell_1, LOW);
  cell_2_discharging = 0;
  digitalWrite(Discharge_Pin_Cell_1, LOW);
  cell_3_discharging = 0;
  digitalWrite(Discharge_Pin_Cell_1, LOW);
}

//-------------------------------------------Functions_Used_By_MPPT_D_Only------------------------------------------------

void mppt_function() {

  count = count + 1; // The MPPT counter
  state_num_mppt = next_state_mppt;
  pwm_modulate(open_loop); // and send it out

  Serial.println("------------------------------MPPT State Machine "
                 "Status----------------------------------------");
  Serial.print("The Current State of MPPT State Machine Is: ");
  Serial.println(state_num_mppt);

  if (count == 2) { // To make sure we have given enough time for the changes to have been
                    // implemented during the pwm_modulate

    Serial.println("----------------------------------MEAS------------------------------------");

    Serial.println("Sampling");
    sampling(); // Sample all of the measurements and check which control mode we are in

    Inst_Power = V_PV * I_PV;
    Out_Power = V_OUT * I_OUT; // Output Power;

    Serial.print("Input Power: ");
    Serial.println(Inst_Power);

    Serial.print("Output_Power: ");
    Serial.println(Out_Power);

    Serial.print("Current_Duty: ");
    Serial.println(open_loop);

    Serial.println(
        "---------------------------NEW_MPPT//STATE------------------------------------");

    if (nu_operational_cells ==
        0) { // If no cells left operating then there is no point of applying MPP
      Serial.println("No operating cells left! - MPPT won't occur");
    }

    else {

      //-----------------Restrictions_Imposition---------------------
      if (state_num_mppt == 0) {
        Serial.print("Setting MPP for: ");
        Serial.print(nu_operational_cells);
        Serial.println(" operational cell");

        Serial.println("-------------------------------------------------------------------------");

      } // This ensures that if during one of the other states the nu_operational_cells changes the
        // max_current_restriction will still be adjusted (midway)

      if (nu_operational_cells == 3) {
        max_current_restriction = max_current_three;
      } else if (nu_operational_cells == 2) {
        max_current_restriction = max_current_two;
      } else if (nu_operational_cells == 1) {
        max_current_restriction = max_current_one;
      }

      if (I_OUT > max_current_restriction || I_OUT < 0) {
        restriction_met = 0; // Inform that the restriction is not satisfied

        if (I_OUT > max_current_restriction) {
          too_much_current = 1;
        }
        if (I_OUT < 0) {
          negative_current = 1;
        }
      }

      //-------------------------------------------------------------

      if (((Count_Up > 0 || Count_Down > 0) && Out_Power > (Max_Power + 0.015)) &&
          restriction_met == 1) { // Ensuring that we are either in states 1 or 2
        Serial.println("New Maximum Found");

        Power_Cond_Met = 1;
        Max_Power = Out_Power;
        Max_Power_Duty = open_loop;

        Serial.print("New_Max_Power_Set: ");
        Serial.println(Max_Power);

        Serial.print("New_Max_Power_Duty_Set: ");
        Serial.println(Max_Power_Duty);

        if (Count_Up > 0) {
          Serial.println("We were in the left of MPP");
          Serial.print("The number of count up(s) is: ");
          Serial.println(Count_Up);
        }
        if (Count_Down > 0) {
          Serial.println("We were in the right of MPP");
          Serial.print("The number of count down(s) is: ");
          Serial.println(Count_Down);
        }
        Serial.println("-------------------------------------------------------------------------");
      }

      switch (state_num_mppt) {
      case 0: {

        Serial.println("RESET/Initial State");
        // Serial.println(restriction_met);

        if (RESET == 0) {
          if (restriction_met == 1) {
            next_state_mppt = 1;
          } else if (restriction_met == 0) {
            next_state_mppt = 5; // Restriction adjusting state
          }

          From_Left = 0;
          From_Right = 0;

          Max_Power = Out_Power;
          Max_Power_Duty = open_loop;
          Serial.print("Max_Power_Set: ");
          Serial.println(Max_Power);
          Serial.print("Max_Power_Duty_Set: ");
          Serial.println(Max_Power_Duty);
          Max_Power = Out_Power;
        } else {
          next_state_mppt = 0;
        }
        break;
      }

      case 1: {

        Serial.println("Left Look Up State");
        Count_Up = Count_Up + 1;

        if (Count_Up == 1 || (Power_Cond_Met == 1 && restriction_met == 1)) {
          open_loop = open_loop - 0.01;
          open_loop = saturation(open_loop, 0.98, 0.02); // saturate the duty cycle
          next_state_mppt = 1;
          Power_Cond_Met = 0;
        }

        else if (Count_Up == 2 && Power_Cond_Met == 0 || restriction_met == 0) {
          open_loop = Max_Power_Duty;
          next_state_mppt = 2;
          Count_Up = 0;
        }

        else if ((Count_Up > 2 && Power_Cond_Met == 0) || (Count_Up > 2 && restriction_met == 0)) {
          open_loop = Max_Power_Duty;
          From_Left = 1;
          next_state_mppt = 3; // Move to DCM avoidance state
          Count_Up = 0;
        }
        break;
      }

      case 2: {

        Serial.println("Right Look Up State");
        Count_Down = Count_Down + 1;

        if (Count_Down == 1 || (Power_Cond_Met == 1 && restriction_met == 1)) {
          open_loop = open_loop + 0.01;
          open_loop = saturation(open_loop, 0.98, 0.02); // saturate the duty cycle
          next_state_mppt = 2;
          Power_Cond_Met = 0;
        }

        else if (Count_Down > 1 && Power_Cond_Met == 0 || Count_Down > 1 && restriction_met == 0) {
          open_loop = Max_Power_Duty;
          From_Right = 1;
          next_state_mppt = 3; // There is no reason to go back to 1 - since we just left, therefore
                               // go to the DCM avoidance state
          Count_Down = 0;
        }

        break;
      }

      case 3: {
        Serial.println("DCM avoidance state");

        DCM_A_Count = DCM_A_Count + 1;

        if (DCM_A_Count == 1) {
          P_Trial_1 = Out_Power;
          next_state_mppt = 3;
        } else if (DCM_A_Count == 2) {
          P_Trial_2 = Out_Power;
          next_state_mppt = 3;
        } else if (DCM_A_Count == 3) {
          P_Trial_3 = Out_Power;
          Serial.print("Trial Power 1: ");
          Serial.println(P_Trial_1);
          Serial.print("Trial Power 2: ");
          Serial.println(P_Trial_2);
          Serial.print("Trial Power 3: ");
          Serial.println(P_Trial_3);

          DCM_A_Count = 0;

          if ((P_Trial_1 < (P_Trial_2 + 0.70) && P_Trial_1 > (P_Trial_2 - 0.70) &&
                  P_Trial_1 < (P_Trial_3 + 0.70) && P_Trial_1 > (P_Trial_3 - 0.70)) ||
              P_Trial_2 < (P_Trial_1 + 0.70) && P_Trial_2 > (P_Trial_1 - 0.70) &&
                  P_Trial_2 < (P_Trial_3 + 0.70) && P_Trial_2 > (P_Trial_3 - 0.70) ||
              P_Trial_3 < (P_Trial_1 + 0.70) && P_Trial_3 > (P_Trial_1 - 0.70) &&
                  P_Trial_3 < (P_Trial_2 + 0.70) && P_Trial_3 > (P_Trial_2 - 0.70)) {
            Serial.println("Checked - No adjustment needed!");
            Serial.print("Final Power Input: ");
            Serial.println(Inst_Power);

            Serial.print("Final Power Output: ");
            Serial.println(Out_Power);

            Serial.print("Final Duty Cycle: ");
            Serial.println(open_loop);

            next_state_mppt = 4;         // Go to rest state
            deduced_current_ref = I_OUT; // That current will be used as a reference current in the
                                         // charging state machine.
          }

          else {
            Serial.print("Adjustment Initialized: ");

            if (From_Left == 1) {
              Serial.println("Left Side Adjustment");
              open_loop =
                  open_loop +
                  0.01; // Do the opposite we did before | There is no need to store this and revert
                        // to the original value since we assume this is an accurate choice and we
                        // want deliberately to result with that chose value for open_loop as initial
                        // value for future (auto - not manual) resets
              Adjusted_Duty = open_loop;
              Serial.print("Adjusted Duty: ");
              Serial.println(Adjusted_Duty);

              next_state_mppt = 3; // Remain in the same state since adjustment is needed
            }

            if (From_Right == 1) {
              Serial.println("Right Side Adjustment");
              open_loop =
                  open_loop -
                  0.01; // Do the opposite we did before | There is no need to store this and revert
                        // to the original value since we assume this is an accurate choice and we
                        // want deliberately to result with that chose value for open_loop as initial
                        // value for future (auto - not manual) resets
              Adjusted_Duty = open_loop;
              Serial.print("Adjusted Duty: ");
              Serial.println(Adjusted_Duty);

              next_state_mppt = 3; // Remain in the same state since adjustment is needed
            }
          }
        }

        break;

      } // Case 3

      case 4: {
        Serial.println("We are in REST state");

        Serial.print("The deduced output current ref is: ");
        Serial.println(deduced_current_ref);

        next_state_mppt = 0; // put that to 0 such that when we will reach the mppt state (in the
                             // charging state machine) the mppt state machine will again start with
                             // state_num_mppt=next_state_mppt=0 as it should
        mppt_finalised = 1;
        break;
      }

      case 5: {
        Serial.println("We are in the restriction adjustment state");

        if (!restriction_met) {
          Serial.print("Adjustment was needed and initiated for: ");

          if (too_much_current == 1) {
            Serial.println("Excessive current avoidance");
            open_loop = open_loop - 0.01; // Decrease the duty cycle to decrease the output voltage
                                          // and thus decrease the output current
          } else if (negative_current) {
            Serial.println("Negative current avoidance");
            open_loop = open_loop + 0.01; // Increase the duty cycle to decrease the output voltage
                                          // and thus decrease the output current
          }
          Adjusted_Duty = open_loop;
          Serial.print("Adjusted Duty: ");
          Serial.println(Adjusted_Duty);
          next_state_mppt = 5; // Stay in the same state
        } else {

          Serial.println("Restriction adjustment complete - Returning to mppt state reset to "
                         "proceed with mppt");
          Serial.print("Final Input Power: ");
          Serial.println(Inst_Power);
          Serial.print("Final Output Power: ");
          Serial.println(Out_Power);
          Serial.print("Final Duty Cycle: ");
          Serial.println(open_loop);
          next_state_mppt = 0;         // Move to rest
          deduced_current_ref = I_OUT; // That current will be used as a reference current in the
                                       // charging state machine.
        }
      }

      } // Case Statements and else of no cells operating
      // VNotes re-initializing the counting
      count = 0;
      Move_Reset = 0;
      restriction_met = 1; // re-initialize restriction
      negative_current = 0;
      too_much_current = 0;
    }
  }
}

void sampling() {

  // Make the initial sampling operations for the circuit measurements

  // sensorValue0 = analogRead(A1); //sample V_PD_R
  // sensorValue1 = analogRead(A0); //sample V_PD_L
  sensorValue0 = 0;              // sample V_PD_R
  sensorValue1 = 0;              // sample V_PD_L
  sensorValue2 = analogRead(A2); // sample V_OUT

  // sensorValue3 = analogRead(A3); //sample Vpd //VNotes this will not be used
  current_mA = ina219.getCurrent_mA(); // sample the inductor current (via the sensor chip) //This
                                       // will be used for I_PV

  // Process the values so they are a bit more usable/readable
  // The analogRead process gives a value between 0 and 1023
  // representing a voltage between 0 and the analogue reference which is 4.096V

  V_PD_R = sensorValue0 * (4.096 / 1023.0);
  V_PD_L = sensorValue1 * (4.096 / 1023.0);
  V_PD_OUT = sensorValue2 * (4.096 / 1023.0);

  V_PV = V_PD_L * 2;
  V_PV_R = V_PD_R * 2; // 2.26 is a testing (fix value for taking out the right measurement)
  V_OUT = V_PD_OUT * 2;

  Serial.print("V_PV is: ");
  Serial.println(V_PV);

  Serial.print("V_PV_R is: ");
  Serial.println(V_PV_R);

  I_PV = (V_PV - V_PV_R) / Res_Value;

  Serial.print("I_PV is: ");
  Serial.println(I_PV);

  // V_Res_R = sensorValue2 * (4.096 / 1023.0); // Convert the V_Res_R sensor reading to volts
  // //Changed in Version 1.1 since the SMPS is used as BOOST and therefore the current sensing
  // resistor can be used for I_PV

  // I_PV=(V_PV-V_Res_R)/Res_Value; //Changed in Version 1.1 since the SMPS is used as BOOST and
  // therefore the current sensing resistor can be used for I_PV

  Serial.print("V_OUT is: ");
  Serial.println(V_OUT);

  I_OUT =
      current_mA / 1000.0; // VNotes adjusted from mA to A (this will be used only for debugging)
                           // //Was made negative since for Boost the current flows the other way
  Serial.print("I_OUT is: ");
  Serial.println(I_OUT);
}

void pwm_modulate(float pwm_input) { // PWM function
  analogWrite(6, (int)(255 - pwm_input * 255));
}

//-----------------------------------Functions_Used_From_MPPT_D_And_Charging----------------------------------------------

float saturation(float sat_input, float uplim, float lowlim) { // Saturation function
  if (sat_input > uplim)
    sat_input = uplim;
  else if (sat_input < lowlim)
    sat_input = lowlim;
  else
    ;
  return sat_input;
}
