#include <Arduino.h>
#include <Wire.h>

int pin5 = 5;
int pin6 = 6;

void setup() {
  pinMode(pin5, OUTPUT);
  pinMode(pin6, OUTPUT);
  Serial.begin(115200);
  Wire.begin();
}

void loop() {
  // off
  Wire.beginTransmission(0x34);
  Wire.write(0x00);
  Wire.write(0x03);
  Wire.write(0x00);
  Wire.write(0x00);
  Wire.write(0x00);
  Wire.write(0x00);
  Wire.endTransmission();

  digitalWrite(pin5, LOW);
  digitalWrite(pin6, LOW);

  delay(1000);

  // on
  Wire.beginTransmission(0x34);
  Wire.write(0x00);
  Wire.write(0x03);
  Wire.write(0x00);
  Wire.write(0x80);
  Wire.write(0x00);
  Wire.write(0x00);
  Wire.endTransmission();

  digitalWrite(pin5, HIGH);
  digitalWrite(pin6, HIGH);

  delay(1000);
}
