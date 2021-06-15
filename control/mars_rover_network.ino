#include <SPI.h>
#include <WiFi.h>

// TODO: find way to have user input for ssid and password
char ssid[] = ""; // TODO: network SSID (name)
char pass[] = ""; // TODO: network password
int esp_status = 0;
IPAddress server(52, 188, 18, 95); // TODO: REPLACE WITH CONSTANT IP ADDRESS FOR OUR SERVER, we
                                   // currently must change this everytime server is set up
WiFiClient client; // Initialize the client library

// is it easier to just have small_state array, SOC array, and SOH array,
// with [0] of each array for batt1, [1] for batt2, [2] for batt3?
// int s_state[3];int SOC[3]; int SOH[3];

int D[8];
struct batt {
  int s_state, SOC, SOH;
};
int err = 0, s_state = 45, l_state = 3; // with placeholder values
int drive[3] = {10, 50, 200};           // {x, y, total_distance} with placeholder values
String DATA = "";                       // concatenate D[7] - D[0]
char temp[6];

// assign placeholder values
batt batt1 = {0, 100, 99};
batt batt2 = {1, 98, 97};
batt batt3 = {2, 96, 95};

void setup() {
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
}

void loop() {
  if (esp_status) {
    Serial.println("connected to server");
    compute();
    assign_values();
    concatenate();
    Serial.print(DATA);
    // Make a HTTP request:
    client.print("asdfghjkl");
    client.print("52, 53");
    Serial.println("Sent 'asdfghjkl' to server!");
    delay(300); // short delay to allow server to receive data from ESP32
  }
  receive_data();
}

void receive_data() {
  int d_length = client.available();
  if (d_length > 0) {
    byte buff[80]; // change size of buffer
    if (d_length > 80) {
      d_length = 80;
    }
    client.read(buff, d_length);
    Serial.println(buff);
  }
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
  D[7] = batt1.s_state + ((batt2.s_state) * 4) + ((batt3.s_state) * 16) + (err * 32);
  D[6] = batt1.SOC;
  D[5] = batt2.SOC;
  D[4] = batt3.SOC;
  D[3] = batt1.SOH;
  D[2] = batt2.SOH;
  D[1] = batt3.SOH;
  D[0] = l_state;
}

void concatenate() {
  for (int i = 7; i >= 0; i--) {
    DATA += char(D[i]);
  }
  //  DATA =
  //  char(D[7])+char(D[6])+char(D[5])+char(D[4])+char(D[3])+char(D[2])+char(D[1])+char(D[0]);
}
