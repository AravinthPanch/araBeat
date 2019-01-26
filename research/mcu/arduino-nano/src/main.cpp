#include <Arduino.h>

void setup() {
  Serial.begin(115200);

  int i = 0x555555555;

  Serial.println(sizeof(i));
  Serial.println(i);
  Serial.println(i, BIN);
}

void loop() {
  // put your main code here, to run repeatedly:
}
