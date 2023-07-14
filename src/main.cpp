#include <Arduino.h>
#include <WiFi.h>

void setup() {
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  
  WiFi.mode(WIFI_STA);

  Serial.print("Connecting to WiFi ..");
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
}

void loop() {
  Serial.println(WiFi.localIP());
  delay(1000);

}

