/*
 *
 * File:     MP3_Shield_RealtimeMIDI.ino 
 * Author:   Matthias Neeracher
 *
 * This code is in the public domain, with the exception of the contents of sVS1053b_Realtime_MIDI_Plugin.
 *
 * The code is based on Nathan Seidle's Sparkfun Electronics example code for the Sparkfun 
 * MP3 Player and Music Instrument shields and and VS1053 breakout board. 
 *
 * http://www.sparkfun.com/Code/MIDI_Example.pde
 * http://dlnmh9ip6v2uc.cloudfront.net/datasheets/Dev/Arduino/Shields/VS_Shield_Example.zip
 *
 *      Spark Fun Electronics 2011
 *      Nathan Seidle
 *
 *      This code is public domain but you buy me a beer if you use this and we meet someday (Beerware license).
 *
 * THEORY OF OPERATIONS
 *
 * The VS1053b has two ways of playing MIDI: One method is that you simply send a Standard MIDI level 0 file through
 * SPI, and the chip will play it. This works exactly the same way as MP3 mode and will not be discussed further here.
 * The other method is that the VS1053b has a "Real Time MIDI mode", in which it will instantly execute MIDI commands 
 * sent to it through either the UART or SPI. 
 *
 * Real Time MIDI mode can be enabled with two different methods, controlled by USE_GPIO_INIT 
 *  (1) Setting GPIO1 to HIGH (which is hardwired in the Sparkfun Music Instrument shield, and can be done through 
 *      pin 4 in the MP3 Player Shield)
 *  (0) Sending a small software patch through SPI.
 *
 * MIDI data can be sent with two different methods as well, controlled by USE_SPI_MIDI
 *  (0) Through a (software) serial connection on pin 3, at 31250 baud
 *  (1) Through SPI, at an arbitrary data rate. For SPI, each byte of MIDI data needs to be prefixed by a 0 byte 
 *      (The V1053b data sheet erroneously states that the padding should be a 0xFF byte).
 *
 * Both initialization methods and both transmission methods can be selected through the #defines below. Out of the box, 
 * it probably makes most sense to enable real time MIDI through pin 4, and send serial data through pin 3, but if you 
 * want to cut the traces for pin 3 and 4 and use those pins for another purpose, the alternative methods may come in 
 * handy. 
 */ 

#define USE_GPIO_INIT  1
#define USE_SPI_MIDI   0

#define USE_PATCH_INIT  !USE_GPIO_INIT
#define USE_SERIAL_MIDI !USE_SPI_INIT
#define USE_SPI         (USE_SPI_MIDI||USE_PATCH_INIT)

#if USE_SPI
#include <SPI.h>
#endif
#if USE_SERIAL_MIDI
#include <SoftwareSerial.h>
SoftwareSerial midiSerial(0,2); // Soft TX on 3, RX not used (2 is an input anyway, for VS_DREQ)
#endif

#if USE_SPI
#define VS_XCS    6 // Control Chip Select Pin (for accessing SPI Control/Status registers)
#define VS_XDCS   7 // Data Chip Select / BSYNC Pin
#define VS_DREQ   3 // Data Request Pin: Player asks for more data
#endif
#if USE_GPIO_INIT
#define VS_GPIO1  5  // Mode selection (0 = file / 1 = real time MIDI)
#endif

#define VS_RESET  9 //Reset is active low

#if USE_PATCH_INIT
//Write to VS10xx register
//SCI: Data transfers are always 16bit. When a new SCI operation comes in 
//DREQ goes low. We then have to wait for DREQ to go high again.
//XCS should be low for the full duration of operation.
void VSWriteRegister(unsigned char addressbyte, unsigned char highbyte, unsigned char lowbyte){
  while(!digitalRead(VS_DREQ)) ; //Wait for DREQ to go high indicating IC is available
  digitalWrite(VS_XCS, LOW); //Select control

  //SCI consists of instruction byte, address byte, and 16-bit data word.
  SPI.transfer(0x02); //Write instruction
  SPI.transfer(addressbyte);
  SPI.transfer(highbyte);
  SPI.transfer(lowbyte);
  while(!digitalRead(VS_DREQ)) ; //Wait for DREQ to go high indicating command is complete
  digitalWrite(VS_XCS, HIGH); //Deselect Control
}

//
// Plugin to put VS10XX into realtime MIDI mode
// Originally from http://www.vlsi.fi/fileadmin/software/VS10XX/vs1053b-rtmidistart.zip
// Permission to reproduce here granted by VLSI solution.
//
const unsigned short sVS1053b_Realtime_MIDI_Plugin[28] = { /* Compressed plugin */
  0x0007, 0x0001, 0x8050, 0x0006, 0x0014, 0x0030, 0x0715, 0xb080, /*    0 */
  0x3400, 0x0007, 0x9255, 0x3d00, 0x0024, 0x0030, 0x0295, 0x6890, /*    8 */
  0x3400, 0x0030, 0x0495, 0x3d00, 0x0024, 0x2908, 0x4d40, 0x0030, /*   10 */
  0x0200, 0x000a, 0x0001, 0x0050,
};

void VSLoadUserCode(void) {
  int i = 0;

  while (i<sizeof(sVS1053b_Realtime_MIDI_Plugin)/sizeof(sVS1053b_Realtime_MIDI_Plugin[0])) {
    unsigned short addr, n, val;
    addr = sVS1053b_Realtime_MIDI_Plugin[i++];
    n = sVS1053b_Realtime_MIDI_Plugin[i++];
    while (n--) {
      val = sVS1053b_Realtime_MIDI_Plugin[i++];
      VSWriteRegister(addr, val >> 8, val & 0xFF);
    }
  }
}

#endif

void setup() {
#if USE_SPI
  pinMode(VS_DREQ, INPUT);
  pinMode(VS_XCS, OUTPUT);
  pinMode(VS_XDCS, OUTPUT);
  digitalWrite(VS_XCS, HIGH); //Deselect Control
  digitalWrite(VS_XDCS, HIGH); //Deselect Data
#endif
#if USE_SERIAL_MIDI
  midiSerial.begin(31250);
#endif

  pinMode(VS_RESET, OUTPUT);

  Serial.begin(57600); //Use serial for debugging 
  Serial.println("\n******\n");
  Serial.println("MP3 Shield Example");

  //Initialize VS1053 chip 
  digitalWrite(VS_RESET, LOW); //Put VS1053 into hardware reset

#if USE_SPI
  //Setup SPI for VS1053
  pinMode(10, OUTPUT); //Pin 10 must be set as an output for the SPI communication to work
  SPI.begin();
  SPI.setBitOrder(MSBFIRST);
  SPI.setDataMode(SPI_MODE0);

  //From page 12 of datasheet, max SCI reads are CLKI/7. Input clock is 12.288MHz. 
  //Internal clock multiplier is 1.0x after power up. 
  //Therefore, max SPI speed is 1.75MHz. We will use 1MHz to be safe.
  SPI.setClockDivider(SPI_CLOCK_DIV16); //Set SPI bus speed to 1MHz (16MHz / 16 = 1MHz)
  SPI.transfer(0xFF); //Throw a dummy byte at the bus
#endif

  delayMicroseconds(1);
  digitalWrite(VS_RESET, HIGH); //Bring up VS1053
  
#if USE_PATCH_INIT
  VSLoadUserCode();
#else
  pinMode(VS_GPIO1, OUTPUT);
  digitalWrite(VS_GPIO1, HIGH);  // Enable real time MIDI mode
#endif
}

void sendMIDI(byte data)
{
#if USE_SPI_MIDI
  SPI.transfer(0);
  SPI.transfer(data);
#else
  midiSerial.write(data);
#endif
}

//Plays a MIDI note. Doesn't check to see that cmd is greater than 127, or that data values are less than 127
void talkMIDI(byte cmd, byte data1, byte data2) {
#if USE_SPI_MIDI
  //
  // Wait for chip to be ready (Unlikely to be an issue with real time MIDI)
  //
  while (!digitalRead(VS_DREQ))
    ;
  digitalWrite(VS_XDCS, LOW);
#endif
  sendMIDI(cmd);
  //Some commands only have one data byte. All cmds less than 0xBn have 2 data bytes 
  //(sort of: http://253.ccarh.org/handout/midiprotocol/)
  if( (cmd & 0xF0) <= 0xB0 || (cmd & 0xF0) >= 0xE0) {
    sendMIDI(data1);
    sendMIDI(data2);
  } else {
    sendMIDI(data1);
  }

#if USE_SPI_MIDI
  digitalWrite(VS_XDCS, HIGH);
#endif
}

//Send a MIDI note-on message.  Like pressing a piano key
//channel ranges from 0-15
void noteOn(byte channel, byte note, byte attack_velocity) {
  talkMIDI( (0x90 | channel), note, attack_velocity);
}

//Send a MIDI note-off message.  Like releasing a piano key
void noteOff(byte channel, byte note, byte release_velocity) {
  talkMIDI( (0x80 | channel), note, release_velocity);
}

void loop() {
  delay(1000);
  
  talkMIDI(0xB0, 0x07, 120); //0xB0 is channel message, set channel volume to near max (127)

#if 1
  //Demo Basic MIDI instruments, GM1
  //=================================================================
  Serial.println("Basic Instruments");
  talkMIDI(0xB0, 0, 0x00); //Default bank GM1

  //Change to different instrument
  for(int instrument = 0 ; instrument < 127 ; instrument++) {

    Serial.print(" Instrument: ");
    Serial.println(instrument, DEC);

    talkMIDI(0xC0, instrument, 0); //Set instrument number. 0xC0 is a 1 data byte command

    //Play notes from F#-0 (30) to F#-5 (90):
    for (int note = 30 ; note < 40 ; note++) {
      Serial.print("N:");
      Serial.println(note, DEC);
      
      //Note on channel 1 (0x90), some note value (note), middle velocity (0x45):
      noteOn(0, note, 127);
      delay(200);

      //Turn off the note with a given off/release velocity
      noteOff(0, note, 127);
      delay(50);
    }

    delay(100); //Delay between instruments
  }
  //=================================================================
#endif

#if 0
  for(int instrument = 0 ; instrument < 1 ; instrument++) {
    for (int bank=0; bank<2; ++bank) {
      talkMIDI(0xB0, 0, bank ? 0x79 : 0);
      Serial.print("Bank: ");
      Serial.print(bank ? 0x79 : 0, DEC);
      Serial.print(" Instrument: ");
      Serial.println(instrument+1, DEC);
  
      talkMIDI(0xC0, instrument, 0);
      noteOn(0, 60, 127);
      noteOn(0, 63, 127);
      noteOn(0, 67, 127);
      delay(2000);
      
      //Turn off the note with a given off/release velocity
      noteOff(0, 60, 127);
      noteOff(0, 63, 127);
      noteOff(0, 67, 127);
      delay(100);
  }
  delay(5000);
}
#endif

#if 0
  //Demo GM2 / Fancy sounds
  //=================================================================
  Serial.println("Demo Fancy Sounds");
  talkMIDI(0xB0, 0, 0x78); //Bank select drums

  //For this bank 0x78, the instrument does not matter, only the note
  for(int instrument = 30 ; instrument < 31 ; instrument++) {

    Serial.print(" Instrument: ");
    Serial.println(instrument, DEC);

    talkMIDI(0xC0, instrument, 0); //Set instrument number. 0xC0 is a 1 data byte command

    //Play fancy sounds from 'High Q' to 'Open Surdo [EXC 6]'
    for (int note = 27 ; note < 87 ; note++) {
      Serial.print("N:");
      Serial.println(note, DEC);
      
      //Note on channel 1 (0x90), some note value (note), middle velocity (0x45):
      noteOn(0, note, 127);
      delay(50);

      //Turn off the note with a given off/release velocity
      noteOff(0, note, 127);
      delay(50);
    }

    delay(100); //Delay between instruments
  }
#endif

#if 0
  //Demo Melodic
  //=================================================================
  Serial.println("Demo Melodic? Sounds");
  talkMIDI(0xB0, 0, 0x79); //Bank select Melodic
  //These don't sound different from the main bank to me

  //Change to different instrument
  for(int instrument = 27 ; instrument < 87 ; instrument++) {

    Serial.print(" Instrument: ");
    Serial.println(instrument, DEC);

    talkMIDI(0xC0, instrument, 0); //Set instrument number. 0xC0 is a 1 data byte command

    //Play notes from F#-0 (30) to F#-5 (90):
    for (int note = 30 ; note < 40 ; note++) {
      Serial.print("N:");
      Serial.println(note, DEC);
      
      //Note on channel 1 (0x90), some note value (note), middle velocity (0x45):
      noteOn(0, note, 127);
      delay(500);

      //Turn off the note with a given off/release velocity
      noteOff(0, note, 127);
      delay(50);
    }

    delay(100); //Delay between instruments
  }
#endif
}
