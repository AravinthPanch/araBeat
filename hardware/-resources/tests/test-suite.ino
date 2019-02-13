#include<SPI.h>
#include "MAX30003.h"
#define MAX30003_CS_PIN   7

void setup() 
{
    Serial.begin(115200);
    
    pinMode(MAX30003_CS_PIN,OUTPUT);
    digitalWrite(MAX30003_CS_PIN,HIGH); //disable device

    SPI.begin();
    SPI.setBitOrder(MSBFIRST); 
    SPI.setDataMode(SPI_MODE0);
  
    Serial.println("init");
}


void loop() 
{   
    digitalWrite(MAX30003_CS_PIN, LOW);
     
    SPI.transfer((INFO<<1 ) | RREG);
    Serial.println(SPI.transfer(0x00));
    Serial.println(SPI.transfer(0x00));
    Serial.println(SPI.transfer(0x00));
    Serial.println("#");
    
    digitalWrite(MAX30003_CS_PIN, HIGH);

    delay(2000);
}

