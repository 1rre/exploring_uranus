#include "SPI.h"
#include <Arduino.h>

// these pins may be different on different boards
// this is for the uno
#define PIN_SS        10
#define PIN_MISO      12
#define PIN_MOSI      11
#define PIN_SCK       13



#define PIN_MOUSECAM_RESET     8
#define PIN_MOUSECAM_CS        7

#define ADNS3080_PIXELS_X                 30
#define ADNS3080_PIXELS_Y                 30

#define ADNS3080_PRODUCT_ID            0x00
#define ADNS3080_REVISION_ID           0x01
#define ADNS3080_MOTION                0x02
#define ADNS3080_DELTA_X               0x03
#define ADNS3080_DELTA_Y               0x04
#define ADNS3080_SQUAL                 0x05
#define ADNS3080_PIXEL_SUM             0x06
#define ADNS3080_MAXIMUM_PIXEL         0x07
#define ADNS3080_CONFIGURATION_BITS    0x0a
#define ADNS3080_EXTENDED_CONFIG       0x0b
#define ADNS3080_DATA_OUT_LOWER        0x0c
#define ADNS3080_DATA_OUT_UPPER        0x0d
#define ADNS3080_SHUTTER_LOWER         0x0e
#define ADNS3080_SHUTTER_UPPER         0x0f
#define ADNS3080_FRAME_PERIOD_LOWER    0x10
#define ADNS3080_FRAME_PERIOD_UPPER    0x11
#define ADNS3080_MOTION_CLEAR          0x12
#define ADNS3080_FRAME_CAPTURE         0x13
#define ADNS3080_SROM_ENABLE           0x14
#define ADNS3080_FRAME_PERIOD_MAX_BOUND_LOWER      0x19
#define ADNS3080_FRAME_PERIOD_MAX_BOUND_UPPER      0x1a
#define ADNS3080_FRAME_PERIOD_MIN_BOUND_LOWER      0x1b
#define ADNS3080_FRAME_PERIOD_MIN_BOUND_UPPER      0x1c
#define ADNS3080_SHUTTER_MAX_BOUND_LOWER           0x1e
#define ADNS3080_SHUTTER_MAX_BOUND_UPPER           0x1e
#define ADNS3080_SROM_ID               0x1f
#define ADNS3080_OBSERVATION           0x3d
#define ADNS3080_INVERSE_PRODUCT_ID    0x3f
#define ADNS3080_PIXEL_BURST           0x40
#define ADNS3080_MOTION_BURST          0x50
#define ADNS3080_SROM_LOAD             0x60

#define ADNS3080_PRODUCT_ID_VAL        0x17


#include <Wire.h>
#include <INA219_WE.h>

INA219_WE ina219; // this is the instantiation of the library for the current sensor

float open_loop, closed_loop, closed_loop_locked; // Duty Cycles
float vpd, vb, vref, iL, dutyref, current_mA; // Measurement Variables
unsigned int sensorValue0, sensorValue1, sensorValue2, sensorValue3; // ADC sample values declaration, we dont need sensorvalue2
float ev = 0, cv = 0, ei = 0, oc = 0; //internal signals
float Ts = 0.0008; //1.25 kHz control frequency. It's better to design the control period as integral multiple of switching period.
float kpv = 0.05024, kiv = 15.78, kdv = 0; // voltage pid.
float u0v, u1v, delta_uv, e0v, e1v, e2v; // u->output; e->error; 0->this time; 1->last time; 2->last last time
float kpi = 0.02512, kii = 39.4, kdi = 0; // current pid.
float u0i, u1i, delta_ui, e0i, e1i, e2i; // Internal values for the current controller
float uv_max = 4, uv_min = 0; //anti-windup limitation
float ui_max = 1, ui_min = 0; //anti-windup limitation
float current_limit = 1.0;
boolean Boost_mode = 0;
boolean CL_mode = 0;

int x_change;
int y_change;

unsigned int loopTrigger;
unsigned int com_count = 0; // a variables to count the interrupts. Used for program debugging.

byte incomingbyte;
//byte incomingbyte = 0b111000; //for testing,(Form [4]direction (1 forwards 0 backwards)/[3]move(0 turn or 1 move )/[2]&[1]speed/[0]clockwise/anticlockwise - The 0b prefix indicates binary number (otherwise it is taken as a decimal)
byte bit_0;
byte bit_1;
byte bit_2;
byte bit_3;
byte bit_4;
byte bit_5;



//************************** Motor Constants **************************//
unsigned long previousMillis = 0; //initializing time counter

int DIRRstate = LOW;              //initializing direction states
int DIRLstate = HIGH;

int DIRL = 21;                    //defining left direction pin
int DIRR = 20;                    //defining right direction pin

int pwmr = 5;                     //pin to control right wheel speed using pwm
int pwml = 9;                     //pin to control left wheel speed using pwm
//*******************************************************************//

String inString = ""; //This is the variable for holding the string
signed long StringToInteger[3] = {69, 420, -552}; //This is the variable for storing the string data as an ints (actually longs / their are total in number = par) //VNotes (Changed to long which basically works as a 4 byte int since the int is 2 byte in Arduino nano)

boolean rx_cond_met = 0, int_splitted = 0; //(cond_met) There is no pending receipt if low and there is if high / (int_spltted) If it is low then the int is not yet splitted and if high it is
boolean tx_cond_met = 0; //Condition informing that all the required ints to be sent have been sent
boolean Is_Negative_TX = 0, Is_Negative_RX = 0; //High when the received number is negative - '-' was initially received
boolean just_exit = 0; //Informing that we just had a serial reception (We went through the if serial.available>0

//We could also add another boolean cond which becomes high when the entire int is received in terms of bytes (as chars) and converted from added chars = string into ints using int to string conversion

int par = 2; //PARAMETER number of ints (longs) to be transmitted-1 (since iterations start at 0)
int iter_of_while = 0; //measuring the iterations in the while loop

double to_be_transd[4] = {0, 0, 0, 0}; //The INTEGERs (total=par) that we want to transmit (can be any int) //VNotes (Changed to long which basically works as a 4 byte int since the int is 2 byte in Arduino nano)

String to_transmit;

int calc; //Used for the int splitting
int k = 0; //Int indicating which number we receive in StringToInteger in terms of the to_be_transd iteration

long total_x = 0;

long total_y = 0;


long total_x1 = 0;

long total_y1 = 0;



long x = 0;
long y = 0;

long a = 0;
long b = 0;




long distance_x = 0;
long distance_y = 0;

long distance_x_previous = 0;
long distance_y_previous = 0;

double total_range = 0;
long actual_speed = 0;
double dx = 0;

//long range_x = 0;
//long range_y = 0;

//long total_range_x1 = 0;
//long total_range_y1 = 0;

//long total_range_x = 0;
//long total_range_y = 0;
long int total_distance = 0;

long int total_x_previous = 0;
long int total_y_previous = 0;

int time_measured_final = 0;
int dt = 0;
int time_measured_initial = 0;

volatile byte movementflag = 0;
volatile int xydat[2];



int convTwosComp(int b) {
  //Convert from 2's complement
  if (b & 0x80) {
    b = -1 * ((b ^ 0xff) + 1);
  }
  return b;
}



int tdistance = 0;


void mousecam_reset()
{
  digitalWrite(PIN_MOUSECAM_RESET, HIGH);
  delay(1); // reset pulse >10us
  digitalWrite(PIN_MOUSECAM_RESET, LOW);
  delay(35); // 35ms from reset to functional
}


int mousecam_init()
{
  pinMode(PIN_MOUSECAM_RESET, OUTPUT);
  pinMode(PIN_MOUSECAM_CS, OUTPUT);

  digitalWrite(PIN_MOUSECAM_CS, HIGH);

  mousecam_reset();

  int pid = mousecam_read_reg(ADNS3080_PRODUCT_ID);
  if (pid != ADNS3080_PRODUCT_ID_VAL)
    return -1;

  // turn on sensitive mode
  mousecam_write_reg(ADNS3080_CONFIGURATION_BITS, 0x19);

  return 0;
}

void mousecam_write_reg(int reg, int val)
{
  digitalWrite(PIN_MOUSECAM_CS, LOW);
  SPI.transfer(reg | 0x80);
  SPI.transfer(val);
  digitalWrite(PIN_MOUSECAM_CS, HIGH);
  delayMicroseconds(50);
}

int mousecam_read_reg(int reg)
{
  digitalWrite(PIN_MOUSECAM_CS, LOW);
  SPI.transfer(reg);
  delayMicroseconds(75);
  int ret = SPI.transfer(0xff);
  digitalWrite(PIN_MOUSECAM_CS, HIGH);
  delayMicroseconds(1);
  return ret;
}

struct MD
{
  byte motion;
  char dx, dy;
  byte squal;
  word shutter;
  byte max_pix;
};


void mousecam_read_motion(struct MD *p)
{
  digitalWrite(PIN_MOUSECAM_CS, LOW);
  SPI.transfer(ADNS3080_MOTION_BURST);
  delayMicroseconds(75);
  p->motion =  SPI.transfer(0xff);
  p->dx =  SPI.transfer(0xff);
  p->dy =  SPI.transfer(0xff);
  p->squal =  SPI.transfer(0xff);
  p->shutter =  SPI.transfer(0xff) << 8;
  p->shutter |=  SPI.transfer(0xff);
  p->max_pix =  SPI.transfer(0xff);
  digitalWrite(PIN_MOUSECAM_CS, HIGH);
  delayMicroseconds(5);
}

// pdata must point to an array of size ADNS3080_PIXELS_X x ADNS3080_PIXELS_Y
// you must call mousecam_reset() after this if you want to go back to normal operation
int mousecam_frame_capture(byte *pdata)
{
  mousecam_write_reg(ADNS3080_FRAME_CAPTURE, 0x83);

  digitalWrite(PIN_MOUSECAM_CS, LOW);

  SPI.transfer(ADNS3080_PIXEL_BURST);
  delayMicroseconds(50);

  int pix;
  byte started = 0;
  int count;
  int timeout = 0;
  int ret = 0;
  for (count = 0; count < ADNS3080_PIXELS_X * ADNS3080_PIXELS_Y; )
  {
    pix = SPI.transfer(0xff);
    delayMicroseconds(10);
    if (started == 0)
    {
      if (pix & 0x40)
        started = 1;
      else
      {
        timeout++;
        if (timeout == 100)
        {
          ret = -1;
          break;
        }
      }
    }
    if (started == 1)
    {
      pdata[count++] = (pix & 0x3f) << 2; // scale to normal grayscale byte range
    }
  }

  digitalWrite(PIN_MOUSECAM_CS, HIGH);
  delayMicroseconds(14);

  return ret;
}



void setup() {

  //************************** Motor Pins Defining **************************//
  pinMode(DIRR, OUTPUT);
  pinMode(DIRL, OUTPUT);
  pinMode(pwmr, OUTPUT);
  pinMode(pwml, OUTPUT);
  //*******************************************************************//

  //Basic pin setups

  pinMode(13, OUTPUT);  //Pin13 is used to time the loops of the controller
  pinMode(3, INPUT_PULLUP); //Pin3 is the input from the Buck/Boost switch
  pinMode(2, INPUT_PULLUP); // Pin 2 is the input from the CL/OL switch
  analogReference(EXTERNAL); // We are using an external analogue reference for the ADC

  // TimerA0 initialization for control-loop interrupt.
  /*
    TCA0.SINGLE.PER = 999; //
    TCA0.SINGLE.CMP1 = 999; //
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV16_gc | TCA_SINGLE_ENABLE_bm; //16 prescaler, 1M.
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_CMP1_bm;
  */
  // TimerB0 initialization for PWM output

  pinMode(6, OUTPUT);
  TCB0.CTRLA = TCB_CLKSEL_CLKDIV1_gc | TCB_ENABLE_bm; //62.5kHz
  analogWrite(6, 120);


  Wire.begin(); // We need this for the i2c comms for the current sensor
  ina219.init(); // this initiates the current sensor
  Wire.setClock(700000); // set the comms speed for i2c


  pinMode(PIN_SS, OUTPUT);
  pinMode(PIN_MISO, INPUT);
  pinMode(PIN_MOSI, OUTPUT);
  pinMode(PIN_SCK, OUTPUT);

  SPI.begin();
  SPI.setClockDivider(SPI_CLOCK_DIV32);
  SPI.setDataMode(SPI_MODE3);
  SPI.setBitOrder(MSBFIRST);

  Serial.begin(38400);
  Serial1.begin(38400);

  if (mousecam_init() == -1)
  {
    //Serial.println("Mouse cam failed to init");
    while (1);
  }
}
char asciiart(int k)
{
  static char foo[] = "WX86*3I>!;~:,`. ";
  return foo[k >> 4];
}

byte frame[ADNS3080_PIXELS_X * ADNS3080_PIXELS_Y];
bool in_the_if = 0;
int v_ref_prev;



void loop() {

  // Serial read instructions
  if (Serial1.available() > 0) {
  
    incomingbyte = Serial1.read();

    bit_0 = bitRead(incomingbyte, 0);
    bit_1 = bitRead(incomingbyte, 1);
    bit_2 = bitRead(incomingbyte, 2);
    bit_3 = bitRead(incomingbyte, 3);
    bit_4 = bitRead(incomingbyte, 4);
    bit_5 = bitRead(incomingbyte, 5);

    //Serial.println(incomingbyte); //Prints it out in binary format (BIN)(for debugging)
  }




  for (int i = 0; i < 8; i++) {
    if (i == 7) {
      loopTrigger = 1;
      //VNotes to make sure that the measurement will be accurate

    }

  }


  if (loopTrigger == 1) { // This loop is triggered, it wont run unless there is an interrupt

    digitalWrite(13, HIGH);   // set pin 13. Pin13 shows the time consumed by each control cycle. It's used for debugging.

    // Sample all of the measurements and check which control mode we are in
    sampling();
    if (v_ref_prev != vref) {
      in_the_if = 0;
    }
    v_ref_prev = vref;
    CL_mode = digitalRead(3); // input from the OL_CL switch
    Boost_mode = digitalRead(2); // input from the Buck_Boost switch

    if (Boost_mode) {
      if (CL_mode) { //Closed Loop Boost
        pwm_modulate(1); // This disables the Boost as we are not using this mode
      } else { // Open Loop Boost
        pwm_modulate(1); // This disables the Boost as we are not using this mode
      }
    } else {
      if (CL_mode) { // Closed Loop Buck
        // The closed loop path has a voltage controller cascaded with a current controller. The voltage controller
        // creates a current demand based upon the voltage error. This demand is saturated to give current limiting.
        // The current loop then gives a duty cycle demand based upon the error between demanded current and measured
        // current
     if(bit_2 && bit_1 && bit_4&& !bit_0 && !bit_3){
          //Serial.print("AAAAAAAAAAAAAAAAYYYYYYYYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
          pwm_modulate(0);
          }

      else  if (in_the_if == 1) {
          pwm_modulate(closed_loop_locked);
        } else if ((vref < (vb + 1.2) && (vref > (vb - 0.2)))) {
          in_the_if = 1; ////Serial.println("PANOO");(debugging)
          closed_loop_locked = closed_loop;
          pwm_modulate(closed_loop_locked);
        } else if (!(vref < (vb + 1.2) && (vref > (vb - 0.2))) && in_the_if == 0) { ////Serial.println("KATOOOO")(debugging);
          pwm_modulate(closed_loop);
        }

        current_limit = 3; // Buck has a higher current limit
        ev = vref - vb;  //voltage error at this time
        cv = pidv(ev); //voltage pid
        cv = saturation(cv, current_limit, 0); //current demand saturation
        ei = cv - iL; //current error
        closed_loop = pidi(ei); //current pid
        closed_loop = saturation(closed_loop, 0.99, 0.01); //duty_cycle saturation



      } else { // Open Loop Buck
        current_limit = 3; // Buck has a higher current limit
        oc = iL - current_limit; // Calculate the difference between current measurement and current limit
        if ( oc > 0) {
          open_loop = open_loop - 0.001; // We are above the current limit so less duty cycle
        } else {
          open_loop = open_loop + 0.001; // We are below the current limit so more duty cycle
        }
        open_loop = saturation(open_loop, dutyref, 0.02); // saturate the duty cycle at the reference or a min of 0.01
        pwm_modulate(open_loop); // and send it out
      }
    }
    // closed loop control path

    digitalWrite(13, LOW);   // reset pin13.
    loopTrigger = 0;
  }


  //************************** Motors **************************//
  //this part of the code decides the direction of motor rotations depending on the time lapsed. currentMillis records the time lapsed once it is called.

  if (bit_3 == 1) { //Case_1
    if (bit_4 == 1 && bit_5 == 0) {
      digitalWrite(pwmr, HIGH);//setting right motor speed at maximum
      digitalWrite(pwml, HIGH);//setting left motor speed at maximum

      //Serial.println("Moving Forwards");

      //moving forwards
      DIRRstate = HIGH;
      DIRLstate = LOW;
    }
    else if (bit_4 == 0 && bit_5 == 0) {
      digitalWrite(pwmr, HIGH);//setting right motor speed at maximum
      digitalWrite(pwml, HIGH);//setting left motor speed at maximum

      //Serial.println("Moving Backwards");

      //moving backwards
      DIRRstate = LOW;
      DIRLstate = HIGH;
    }
    else if (bit_4 == 1 && bit_5 == 1 && bit_0 == 0) {
      analogWrite(pwmr, 180);
      analogWrite(pwml, 255);//setting left motor speed at maximum

      //Serial.println("Moving Forwards Clockwise");

      //moving forward clockwise
      DIRRstate = HIGH;
      DIRLstate = LOW;
    }
    else if (bit_4 == 1 && bit_5 == 1 && bit_0 == 1) {
      analogWrite(pwml, 180);
      analogWrite(pwmr, 255);//setting left motor speed at maximum

      //Serial.println("Moving Forwards Anticlockwise");

      //moving forward anticlockwise
      DIRRstate = HIGH;
      DIRLstate = LOW;
    }
    else if (bit_4 == 0 && bit_5 == 1 && bit_0 == 0) {
      analogWrite(pwml, 180);//setting left motor speed at maximum
      analogWrite(pwmr, 255);

      //Serial.println("Moving Backwards Clockwise");


      //moving backwards clockwise
      DIRRstate = LOW;
      DIRLstate = HIGH;
    }
    else if (bit_4 == 0 && bit_5 == 1 && bit_0 == 1) {
      analogWrite(pwmr, 180);//setting left motor speed at maximum
      analogWrite(pwml, 255);

      //Serial.println("Moving Backwards Anticlockwise");


      //moving backwards anticlockwise
      DIRRstate = LOW;
      DIRLstate = HIGH;
    }
  }

  else if (bit_3 == 0) { //Case_2
    digitalWrite(pwmr, HIGH);//setting right motor speed at maximum
    digitalWrite(pwml, HIGH);//setting left motor speed at maximum

    if (bit_0 == 0) {

      //Serial.println("Rotating clockwise");

      //rotating clockwise
      DIRRstate = LOW;
      DIRLstate = LOW;
    }
    else if (bit_0 == 1) {

      //Serial.println("Rotating anticlockwise");

      //rotating anticlockwise
      DIRRstate = HIGH;
      DIRLstate = HIGH;
    }
  }


  digitalWrite(DIRR, DIRRstate);
  digitalWrite(DIRL, DIRLstate);

  //*******************************************************************//

#if 0

  /*
      if(movementflag){

      tdistance = tdistance + convTwosComp(xydat[0]);
      //Serial.println("Distance = " + String(tdistance));
      movementflag=0;
      delay(3);
      }

  */
  // if enabled this section grabs frames and outputs them as ascii art
  /*
    if (mousecam_frame_capture(frame) == 0)
    {
      int i, j, k;
      for (i = 0, k = 0; i < ADNS3080_PIXELS_Y; i++)
      {
        for (j = 0; j < ADNS3080_PIXELS_X; j++, k++)
        {
          //Serial.print(asciiart(frame[k]));
          //Serial.print(' ');
        }
        //Serial.println();
      }
    }
    //Serial.println();
    delay(30);
  */
#else

  // if enabled this section produces a bar graph of the surface quality that can be used to focus the camera
  // also dra.wn is the average pixel value 0-63 and the shutter speed and the motion dx,dy.

  int val = mousecam_read_reg(ADNS3080_PIXEL_SUM);
  MD md;

  time_measured_final = millis();
  dt = time_measured_final - time_measured_initial; //meassure the dt at which we measure the dx and dy in order to use it for instantaneous speed ds/dt
  //Serial.println("The dt is ");
  //Serial.println(dt);
  mousecam_read_motion(&md);
  Serial.print("quality: "+String(md.squal));

  // for (int i = 0; i < md.squal / 4; i++)
  //   //Serial.print('*');
  //  //Serial.print(' ');
  //  //Serial.print((val * 100) / 351);
  //  //Serial.print(' ');
  // //Serial.print(md.shutter); //Serial.print(" (");
  //  //Serial.print((int)md.dx); //Serial.print(',');
  // //Serial.print((int)md.dy); //Serial.println(')');

  // //Serial.println(md.max_pix);
  //  delay(10);

  time_measured_initial = millis();

  distance_x = md.dx; //convTwosComp(md.dx);
  distance_y = md.dy; //convTwosComp(md.dy);

  total_x1 = (total_x1 + distance_x);
  total_y1 = (total_y1 + distance_y);


  total_x = 10 * total_x1 / 157; //Conversion from counts per inch to mm (400 counts per inch)
  total_y = 10 * total_y1 / 157; //Conversion from counts per inch to mm (400 counts per inch)


  //Notes--------

  // range_x = abs(md.dx); //convTwosComp(md.dx);
  // range_y = abs(md.dy); //convTwosComp(md.dy);

  //total_range_x1 = (total_range_x1 + range_x);
  //total_range_y1 = (total_range_y1 + range_y);

  //total_range_x = 10 * total_range_x1 / 157; //Conversion from counts per inch to mm (400 counts per inch)
  //total_range_y = 10 * total_range_y1 / 157; //Conversion from counts per inch to mm (400 counts per inch)
 x_change = abs(total_x) - abs(distance_x_previous);
 y_change = abs(total_y) - abs(distance_y_previous);

  dx = sqrt(sq(x_change) + sq(y_change));
 // if(dx>15)
  total_range += dx;

  actual_speed = dx / dt;

  distance_x_previous = total_x;//distance_x; //Make the current total_previous equal to the current total_ (both for x and y)
  distance_y_previous = total_y;//;distance_y;
  //-----------------

  //Serial.print('\n');


  //Serial.println("Distance_x = " + String(total_x));

  //Serial.println("Distance_y = " + String(total_y));
  //Serial.println("Total_range = " + String(total_range));
  //Serial.println("change = " + String(dx));
  

  //Serial.print('\n');
  //-------------------------------

  to_be_transd[0] = total_x;
  to_be_transd[1] = total_y;
  to_be_transd[2] = total_range;
  to_be_transd[3] = actual_speed;
  to_transmit = String(to_be_transd[0]) + "U" + String(to_be_transd[1]) + "U" + String(to_be_transd[2]) + "U" + to_be_transd[3] + "U" ;

  for (int i = 0; i < to_transmit.length(); i++) {
    Serial1.print(to_transmit[i]);
   // Serial.print(to_transmit[i]);
  } //Serial.println();


  //------------------------------------
  // //Serial.println("from the ESP " + char(Serial1.read()));
  //Notes

  // //Serial.println("Range_x = " + String(total_range_x));

  ////Serial.println("Range_y = " + String(total_range_y));

  ////Serial.println("Total_distance = " + String(total_distance));
  ////Serial.print('\n');
  //unsigned long aftersend = millis();
  ////Serial.println("TIMING of SENDING: " + String(aftersend - beforesend));
  //


#endif
}



// Timer A CMP1 interrupt. Every 800us the program enters this interrupt.
// This, clears the incoming interrupt flag and triggers the main loop.
/*
  ISR(TCA0_CMP1_vect){
  TCA0.SINGLE.INTFLAGS |= TCA_SINGLE_CMP1_bm; //clear interrupt flag
  loopTrigger = 1;
  }
*/
// This subroutine processes all of the analogue samples, creating the required values for the main loop

void sampling() {

  // Make the initial sampling operations for the circuit measurements

  sensorValue0 = analogRead(A0); //sample Vb
  //sensorValue2 = analogRead(A2); //sample Vref
  sensorValue3 = analogRead(A3); //sample Vpd
  current_mA = ina219.getCurrent_mA(); // sample the inductor current (via the sensor chip)


  // Process the values so they are a bit more usable/readable
  // The analogRead process gives a value between 0 and 1023
  // representing a voltage between 0 and the analogue reference which is 4.096V

  vb = sensorValue0 * (4.096 / 1023.0); // Convert the Vb sensor reading to volts
  //vref = sensorValue2 * (4.096 / 1023.0); // Convert the Vref sensor reading to volts
  vpd = sensorValue3 * (4.096 / 1023.0); // Convert the Vpd sensor reading to volts
 // Serial.println("VVVVVVVVVVVVVVbbbbbbbbBBBBBBBBBBBBb " + String(vb));
  if (bit_1 == 0 & bit_2 == 0) {
    vref = 4.5; //(The voltages have been set by default to V)
    //Serial.println("Speed is set to: High");
  }
  if (bit_1 == 1 & bit_2 == 0) {
    vref = 3;
    //Serial.println("Speed is set to: Medium");
  }
  if (bit_1 == 0 & bit_2 == 1) {
    vref = 1.6;
    //Serial.println("Speed is set to: Slow");
  }

  else if (bit_1 == 1 & bit_2 == 1) { //STOP
    vref = 0;
    //Serial.println("Speed is set to: Zero-Stopped");
  }

//  Serial.print("The VREF is: "); //Debugging
 // Serial.println(vref);

  //Serial.print("The VB is: "); //Debugging
  //Serial.println(vb);

  //Serial.println("-------------------Incoming/Bits---------------------");//Notes printout the incoming bits

  //Serial.print(bit_5);
  //Serial.print(' ');
  //Serial.print(bit_4);
  //Serial.print(' ');
  //Serial.print(bit_3);
  //Serial.print(' ');
  //Serial.print(bit_2);
  //Serial.print(' ');
  //Serial.print(bit_1);
  //Serial.print(' ');
  //Serial.print(bit_0);
  //Serial.println('-');

  //Serial.println("---------------------------------------------------");

  // The inductor current is in mA from the sensor so we need to convert to amps.
  // We want to treat it as an input current in the Boost, so its also inverted
  // For open loop control the duty cycle reference is calculated from the sensor
  // differently from the Vref, this time scaled between zero and 1.
  // The boost duty cycle needs to be saturated with a 0.33 minimum to prevent high output voltages

  if (Boost_mode == 1) {
    iL = -current_mA / 1000.0;
    dutyref = saturation(vref * (1.0 / 1023.0), 0.99, 0.33);
  } else {
    iL = current_mA / 1000.0;
    dutyref = vref * (1.0 / 1023.0);
  }

}

float saturation( float sat_input, float uplim, float lowlim) { // Saturatio function
  if (sat_input > uplim) sat_input = uplim;
  else if (sat_input < lowlim ) sat_input = lowlim;
  else;
  return sat_input;
}

void pwm_modulate(float pwm_input) { // PWM function
  analogWrite(6, (int)(255 - pwm_input * 255));
  //Serial.print("PWM Duty: ");
  //Serial.println(pwm_input);
  //Serial.print("PWM Duty_locked: ");
  //Serial.println(closed_loop_locked);

}

// This is a PID controller for the voltage

float pidv( float pid_input) {
  float e_integration;
  e0v = pid_input;
  e_integration = e0v;

  //anti-windup, if last-time pid output reaches the limitation, this time there won't be any intergrations.
  if (u1v >= uv_max) {
    e_integration = 0;
  } else if (u1v <= uv_min) {
    e_integration = 0;
  }

  delta_uv = kpv * (e0v - e1v) + kiv * Ts * e_integration + kdv / Ts * (e0v - 2 * e1v + e2v); //incremental PID programming avoids integrations.there is another PID program called positional PID.
  u0v = u1v + delta_uv;  //this time's control output

  //output limitation
  saturation(u0v, uv_max, uv_min);

  u1v = u0v; //update last time's control output
  e2v = e1v; //update last last time's error
  e1v = e0v; // update last time's error
  return u0v;
}

// This is a PID controller for the current

float pidi(float pid_input) {
  float e_integration;
  e0i = pid_input;
  e_integration = e0i;

  //anti-windup
  if (u1i >= ui_max) {
    e_integration = 0;
  } else if (u1i <= ui_min) {
    e_integration = 0;
  }

  delta_ui = kpi * (e0i - e1i) + kii * Ts * e_integration + kdi / Ts * (e0i - 2 * e1i + e2i); //incremental PID programming avoids integrations.
  u0i = u1i + delta_ui;  //this time's control output

  //output limitation
  saturation(u0i, ui_max, ui_min);

  u1i = u0i; //update last time's control output
  e2i = e1i; //update last last time's error
  e1i = e0i; // update last time's error
  return u0i;
}


/*end of the program.*/
