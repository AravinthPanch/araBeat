/**
   Author: Aravinth Panchadcharam
   Email: me@aravinth.info
   Date: 11/07/18.
   Project: araBeat
*/

#include "midi.h"

midi arabeat;

void setup() {
  Serial.begin(9600);
  Serial.println("VS1053 MIDI");
  pinMode(VS1053_RESET, OUTPUT);
  digitalWrite(VS1053_RESET, LOW);
  delay(10);
  digitalWrite(VS1053_RESET, HIGH);
  delay(10);

  arabeat.setChannelBank(0, VS1053_BANK_MELODY);
  arabeat.setInstrument(0, VS1053_GM1_OCARINA);
  arabeat.setChannelVolume(0, 64);
}

void loop() {
  for (uint8_t i=60; i<69; i++) {
    arabeat.noteOn(0, i, 127);
    delay(100);
    arabeat.noteOff(0, i, 127);
  }

  delay(1000);
}
