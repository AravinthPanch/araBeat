#include <Arduino.h>
#include <plot.h>

int pin5 = 5;
int pin6 = 6;
plot plotter;

void setup() {
  pinMode(pin5, OUTPUT);
  pinMode(pin6, OUTPUT);
  Serial.begin(115200);
}

void loop() {

  for (int i = 0; i < 5; i++) {
    digitalWrite(pin5, HIGH);
    digitalWrite(pin6, HIGH);
    // plotter.send_data_to_arabeat_gui(plot::DIGITAL_VAL0, 1);
    plotter.send_data_to_arduino_plotter(1);
    delay(50);
  }

  for (int i = 0; i < 50; i++) {
    digitalWrite(pin5, LOW);
    digitalWrite(pin6, LOW);
    // plotter.send_data_to_arabeat_gui(plot::DIGITAL_VAL0, 0);
    plotter.send_data_to_arduino_plotter(0);
    delay(10);
  }
}
