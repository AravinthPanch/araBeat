#include <Arduino.h>
#include <plot.h>

int pin13 = 13;
int pin6 = 6;
int pin2 = 2;
int pin5 = 5;
plot plotter;

void setup() {
  pinMode(pin5, OUTPUT);
  pinMode(pin6, OUTPUT);
  Serial.begin(115200);
}

void loop() {
  digitalWrite(pin2, LOW);
  digitalWrite(pin6, LOW);
  digitalWrite(pin5, HIGH);
  digitalWrite(pin13, HIGH);
  delay(200);

  digitalWrite(pin2, HIGH);
  digitalWrite(pin6, HIGH);
  digitalWrite(pin5, LOW);
  digitalWrite(pin13, LOW);
  delay(633);
}
