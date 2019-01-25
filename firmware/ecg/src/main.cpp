/*******************************************************************************
 *
 *	@brief	MAX30003 ECG
 *
 ********************************************************************************/

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include <Arduino.h>
#include <MAX30003.h>


/*******************************************************************************
 * Variable declarations
 ********************************************************************************/
uint8_t DataPacketHeader[20];
signed long ecgdata;
unsigned long data;
MAX30003 ecg;

/*******************************************************************************
 * Functions
 ********************************************************************************/
void setup()
{
    Serial.begin(115200);

    pinMode(MAX30003_CS_PIN, OUTPUT);
    digitalWrite(MAX30003_CS_PIN, HIGH); // disable device

    SPI.begin();
    SPI.setBitOrder(MSBFIRST);
    SPI.setDataMode(SPI_MODE0);


    ecg.MAX30003_begin(); // initialize MAX30003
}

/*******************************************************************************
 * ECG Readout
 ********************************************************************************/
void loop()
{
    ecg.MAX30003_Reg_Read(ECG_FIFO);

    unsigned long data0 = (unsigned long)(SPI_temp_32b[0]);
    data0 = data0 << 24;
    unsigned long data1 = (unsigned long)(SPI_temp_32b[1]);
    data1 = data1 << 16;
    unsigned long data2 = (unsigned long)(SPI_temp_32b[2]);
    data2 = data2 >> 6;
    data2 = data2 & 0x03;

    data = (unsigned long)(data0 | data1 | data2);
    ecgdata = (signed long)(data);

    ecg.MAX30003_Reg_Read(RTOR);
    unsigned long RTOR_msb = (unsigned long)(SPI_temp_32b[0]);
    // RTOR_msb = RTOR_msb <<8;
    unsigned char RTOR_lsb = (unsigned char)(SPI_temp_32b[1]);

    unsigned long rtor = (RTOR_msb << 8 | RTOR_lsb);
    rtor = ((rtor >> 2) & 0x3fff);

    float hr = 60 / ((float)rtor * 0.008);
    unsigned int HR = (unsigned int)hr; // type cast to int

    unsigned int RR = (unsigned int)rtor * 8; // 8ms

    /*Serial.print(RTOR_msb);
    Serial.print(",");
    Serial.print(RTOR_lsb);
    Serial.print(",");
    Serial.print(rtor);
    Serial.print(",");
    Serial.print(rr);
    Serial.print(",");
    Serial.println(hr);      */

    DataPacketHeader[0] = 0x0A;
    DataPacketHeader[1] = 0xFA;
    DataPacketHeader[2] = 0x0C;
    DataPacketHeader[3] = 0;
    DataPacketHeader[4] = 0x02;

    DataPacketHeader[5] = ecgdata;
    DataPacketHeader[6] = ecgdata >> 8;
    DataPacketHeader[7] = ecgdata >> 16;
    DataPacketHeader[8] = ecgdata >> 24;

    DataPacketHeader[9] = RR;
    DataPacketHeader[10] = RR >> 8;
    DataPacketHeader[11] = 0x00;
    DataPacketHeader[12] = 0x00;

    DataPacketHeader[13] = HR;
    DataPacketHeader[14] = HR >> 8;
    DataPacketHeader[15] = 0x00;
    DataPacketHeader[16] = 0x00;

    DataPacketHeader[17] = 0x00;
    DataPacketHeader[18] = 0x0b;

    for (int i = 0; i < 19; i++) // transmit the data
    {
        Serial.write(DataPacketHeader[i]);
    }

    delay(8);
}
