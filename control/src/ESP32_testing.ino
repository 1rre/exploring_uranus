#include <WiFi.h>

const char* ssid = "ssid";
const char* password = "password";
IPAddress local_IP(192, 168, 1, 184);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 0, 0);
IPAddress primaryDNS(8, 8, 8, 8);   //optional
IPAddress secondaryDNS(8, 8, 4, 4);   //optional

unsigned long previousMillis = 0;
unsigned long interval = 30000;

void setup() {
  // put your setup code here, to run once:
  /*WiFi.mode(WIFI_AP_STA);
   * WiFi.softAP("i am groot", NULL);
   */
   WiFi.disconnect();
   delay(1000);
   Serial.begin(115200);
   initWiFi();
   /*manually assign static IP address
   if(!WiFi.config(local_IP, gateway, subnet, primaryDNS, secondaryDNS)){
    Serial.println("STA failed to configure");
    }
    */
   Serial.print("localIP: ");
   Serial.println(WiFi.localIP());
   Serial.print("RSSI: ");
   Serial.println(WiFi.RSSI());
}

void loop() {
  // put your main code here, to run repeatedly:
  unsigned long currentMillis = millis();
  //try reconnecting is WiFi is disconnected
  if(WiFi.status() != WL_CONNECTED && (currentMillis - previousMillis >= interval)){
    Serial.println(millis());
    Serial.println("reconnecting to WiFi ...");
    WiFi.disconnect();
    delay(1000);
    WiFi.reconnect();
    }
}

void initWiFi(){
  WiFi.mode(WIFI_STA);    //set ESP32 to station mode to connect to accesspoint/hotspot
  WiFi.begin("Champion_2.4G", "0818550634");   //connect to a network, pass arguments SSID and password 
  Serial.print("Connecting to WiFi ...");
  while(WiFi.status() != WL_CONNECTED){
    Serial.println('.');
    delay(1000);
    }
    Serial.println("");
    Serial.println("Connected!");
  }
