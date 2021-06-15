/*
   Release notes: still needs HEAVY TYPE CHECKING
*/

#include <SPI.h>
#include <WiFi.h>

// TODO: find way to have user input for ssid and password?
char ssid[] = ""; // TODO: network SSID (name)
char pass[] = ""; // TODO: network password
int esp_status = 0;
IPAddress server(
    13, 68, 147, 164); // TODO: REPLACE WITH CONSTANT IP ADDRESS FOR OUR SERVER 13.68.147.164
WiFiClient client;     // Initialize the client library
String DATA1 = "-dcba`_1dd";
String DATA2 = "abcdefghij";
char data_in;          // from client.read()
int data_out;          // NEW: data_out for manual mode
int data_out_auto[80]; // NEW: data_out for automatic mode

// from mars_rover_network_data.ino
int D[10];   // the array which will hold the 10 chars before concatenation
int err = 0; // with placeholder value
struct batt {
  int s_state, SOC, SOH;
};
// THESE SHOULD RATHER BE READ FROM ANALOG OR SERIAL
// DEPENDING ON WHICH PINS ENERGY IS CONNECTED THRU
// NB: MOVE TO void loop()?
int s_state = 45, l_state = 3; // with placeholder value
int drive[3] = {10, 50, 200};  // {x, y, total_distance} with placeholder values
String DATA = "";              // concatenate D[7] - D[0]
char temp[6];
//_______________________________________

// assign placeholder values
batt batt1 = {0, 100, 99};
batt batt2 = {1, 98, 97};
batt batt3 = {2, 96, 95};

void setup() {
  // put your setup code here, to run once:
  WiFi.disconnect();
  delay(1000);
  Serial.begin(9600);
  connect_WiFi(ssid, pass);

  Serial.print("SSID: ");         // TODO: delete this later?
  Serial.println(ssid);           // TODO: delete this later?
  Serial.print("localIP: ");      // TODO: delete this later?
  Serial.println(WiFi.localIP()); // TODO: delete this later?

  while (esp_status != 1) {
    connect_to_Server(); // try connecting to server until connected
  }
  Serial.println("connected to server");
}

void loop() {
  receive_data();
  process_data(data_in);
  compute();
  assign_values();
  concatenate();
  Serial.print(DATA); // for testing if compute(), assign_values(), and concatenate() work, hint:
                      // they don't lol
  client.print(DATA);
  client.print(DATA1); // for testing if can send string to server and server interprets correctly,
                       // hint: they DO
  Serial.println("Sent '-dcba`_1dd' to server!");
  delay(400);
  client.print(DATA2);
  Serial.println("Sent 'abcdefghij' to server!");
  delay(400); // short delay to allow server to receive data from ESP32
}

void connect_WiFi(char ssid[], char pass[]) {
  int ctr = 0;
  WiFi.mode(WIFI_STA);    // set ESP32 to station mode to connect to accesspoint/hotspot
  WiFi.begin(ssid, pass); // connect to a network, pass arguments SSID and password
  Serial.print("Connecting to WiFi ...");

  while (WiFi.status() != WL_CONNECTED) {
    if (ctr > 5) {       // if the esp32 has been trying to connect for more than 5 seconds
      ctr = -1;          // reset clock counter
      WiFi.disconnect(); // disconnect from the network
      Serial.println("Unable to connect to WiFi...");
      delay(1000);            // allow some time to disconnect
      WiFi.begin(ssid, pass); // connect to a network, pass arguments SSID and password
      Serial.println("Reconnecting to WiFi");
    } else {
      delay(1000); // allow time for esp32 to connect to the network
      Serial.println('.');
    }
    ctr++; // increment clock counter
  }
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("connected to WiFi!");
  } else {
    Serial.println("connection failed");
  }
}

void connect_to_Server() {
  Serial.println("\nStarting connection to Web Server...");
  esp_status = client.connect(server, 8080); // Port 8080 (write)
  delay(1000); // allow time for the esp32 to establish connection to the web server
  Serial.println(esp_status);
  switch (esp_status) { // report esp_status back via serial:
  case 1:
    Serial.println("esp_status = 1; SUCCESS");
    break;
  case -1:
    Serial.println("esp_status = -1; TIMED_OUT");
    break;
  case -2:
    Serial.println("esp_status = -2; INVALID_SERVER");
    break;
  case -3:
    Serial.println("esp_status = -3; TRUNCATED");
    break;
  case -4:
    Serial.println("esp_status = -4; INVALID_RESPONSE");
    break;
  default:
    Serial.println("esp_status = 0; something went wrong lol");
  }
  delay(300);
  if (esp_status != 1) {
    Serial.println("connection to web server failed");
  } else {
    Serial.println("established connection with web server");
  }
}

void receive_data() {
  int d_length = client.available();
  if (d_length > 0) {
    //    byte buff[80]; // TODO: change size of buffer
    //    if (d_length > 80) {
    //      d_length = 80;
    //    }
    data_in = client.read();
    Serial.print("Data received from server: "); // this is for TESTING
    Serial.println(data_in);                     // this is for TESTING
  }
}

// TODO: implement the Serial2.println(); codes
// how to CONVERT CHAR TO INT--> SUBTRACT 48 from the CHAR
//(int)char /*is equivalent to*/ int = char - 48,
// NB: '0' in ascii has value 48 in DEC
void process_data(char data_in) {
  if (data_in == 183) { // EMERGENCY STOP
    data_out = (int)data_in;
    D[1] = (int)data_in;
    compute();
    assign_values();
    concatenate();
    while (true) {
      client.print(DATA);
      Serial2.println(22, BIN); // loops the STOP instruction infinitely
    }
  } else if (data_in < 176) { // equivalent to ((int)data_in < 128), so (data_in - 48 < 128)
    data_out = (int)data_in;  // equivalent to (data_in - 48)
    D[1] = (int)data_in;
    Serial2.println(data_out, BIN);

    // PLS CHECK IF THE COMMENTED CODE BELOW CAN BE OPTIMISED INTO THE 2 LINES ABOVE?
    //    switch (data_in) {
    //      //MANUAL MODE
    //      case char(26):
    //        Serial2.println(26, BIN); //MOVE FORWARDS
    //        break;
    //      case char(10):
    //        Serial2.println(10, BIN); //MOVE BACKWARDS
    //        break;
    //      case char(18):
    //        Serial2.println(18, BIN); //TURN RIGHT (ROTATE CLOCKWISE)
    //        break;
    //      case char(3):
    //        Serial2.println(3, BIN);  //TURN LEFT (ROTATE ANTICLOCKWISE)
    //        break;
    //      case char(59):
    //        Serial2.println(59, BIN); //STEER LEFT
    //        break;
    //      case char(58):
    //        Serial2.println(58, BIN); //STEER RIGHT
    //        break;
    //      case char(22):
    //        Serial2.println(22, BIN); //STOP
    //        break;
    //    }

  } else if (data_in > 175) { // equivalent to ((int)data_in > 127), so (data_in - 48 > 127)
    // AUTOMATIC MODE
    // DO WE HAVE FUNCTIONS FOR THESE PRE-DEFINED MANEUVERS?
    switch (data_in) {
    case char(128):
      Serial2.println("/*TODO*/"); // don’t move FOR HOW LONG?
      Serial2.println(22, BIN);
      data_out = char(26);
      break;
    case char(129):
      Serial2.println("/*TODO*/"); // explore the 1mx1m in front, going to the RIGHT
      break;
    case char(130):
      Serial2.println("/*TODO*/"); // explore the 1mx1m in front, going to the LEFT
      break;
    case char(131):
      Serial2.println("/*TODO*/"); // move 1 m FORWARDS
      break;
    case char(132):
      Serial2.println("/*TODO*/"); // move 1 m BACKWARDS
      break;
    case char(133):
      Serial2.println("/*TODO*/"); // automatic strip of 1m endless to the RIGHT
      break;
    case char(134):
      Serial2.println("/*TODO*/"); // automatic strip of 1m endless to the LEFT
      break;
    }
  }
}

// compute()
void compute() {
  String a0 = "", a1 = "", a2 = "";
  itoa(s_state, temp, 2);
  a0 = temp[0] + temp[1]; // batt1.s_state
  a1 = temp[2] + temp[3]; // batt2.s_state
  a2 = temp[4] + temp[5]; // batt3.s_state
  batt1.s_state = bin_to_dec(a0);
  batt2.s_state = bin_to_dec(a1);
  batt3.s_state = bin_to_dec(a2);
}

int bin_to_dec(String str) {
  if (str == "00") {
    return 0;
  } else if (str == "01") {
    return 1;
  } else if (str == "10") {
    return 2;
  } else if (str == "11") {
    return 3;
  }
}

void assign_values() {
  // D[9] is the combination of small state and error code
  D[9] = batt1.s_state + ((batt2.s_state) * 4) + ((batt3.s_state) * 16) + (err * 32);
  D[8] = batt1.SOC;
  D[7] = batt2.SOC;
  D[6] = batt3.SOC;
  D[5] = batt1.SOH;
  D[4] = batt2.SOH;
  D[3] = batt3.SOH;
  D[2] = l_state; // big state
  // D[1] = (int)data_in;     //the data read from client.read(), THIS IS ALREADY DONE IN
  // process_data()
  D[0] = 80; // ball colour/ grid specifier. currently placeholder value
}

void concatenate() {
  int arr_size = (sizeof(D) / sizeof(D[0]));
  for (int i = arr_size; i >= 0; i--) {
    DATA += char(D[i]);
  }
  //  DATA =
  //  char(D[7])+char(D[6])+char(D[5])+char(D[4])+char(D[3])+char(D[2])+char(D[1])+char(D[0]);
}
