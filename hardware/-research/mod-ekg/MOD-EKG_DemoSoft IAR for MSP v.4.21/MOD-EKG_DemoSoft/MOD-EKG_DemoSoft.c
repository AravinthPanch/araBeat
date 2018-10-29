//*****************************************************************************
//   MSP430FG439-Heart Rate Monitor Demo
//
//   Description; Uses one Instrumentation Amplifier INA321 and the three
//   internal opamps of the MSP430FG439
//
//   Murugavel Raju 
//   Texas Instruments, Inc
//   October 2004
//   Edited by: M Morales, November 2008 
//   * Updated to non-depracated intrinsic functions
//   * Changed spacing for legibility 
//   Edited by: 
//   Penko T. Bozhkov - Olimex LTD, 05.10.2012
//   * RTC capcitors changed according to Olimex's crystall requirements
//   * Olimex LCD definitions are added and heart rate is visualized at 2 places on LCD
//   Built with IAR Embedded Workbench Version: 4.21
//*****************************************************************************
//*****************************************************************************
// THIS PROGRAM IS PROVIDED "AS IS". TI MAKES NO WARRANTIES OR
// REPRESENTATIONS, EITHER EXPRESS, IMPLIED OR STATUTORY,
// INCLUDING ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE, LACK OF VIRUSES, ACCURACY OR
// COMPLETENESS OF RESPONSES, RESULTS AND LACK OF NEGLIGENCE.
// TI DISCLAIMS ANY WARRANTY OF TITLE, QUIET ENJOYMENT, QUIET
// POSSESSION, AND NON-INFRINGEMENT OF ANY THIRD PARTY
// INTELLECTUAL PROPERTY RIGHTS WITH REGARD TO THE PROGRAM OR
// YOUR USE OF THE PROGRAM.
//
// IN NO EVENT SHALL TI BE LIABLE FOR ANY SPECIAL, INCIDENTAL,
// CONSEQUENTIAL OR INDIRECT DAMAGES, HOWEVER CAUSED, ON ANY
// THEORY OF LIABILITY AND WHETHER OR NOT TI HAS BEEN ADVISED
// OF THE POSSIBILITY OF SUCH DAMAGES, ARISING IN ANY WAY OUT
// OF THIS AGREEMENT, THE PROGRAM, OR YOUR USE OF THE PROGRAM.
// EXCLUDED DAMAGES INCLUDE, BUT ARE NOT LIMITED TO, COST OF
// REMOVAL OR REINSTALLATION, COMPUTER TIME, LABOR COSTS, LOSS
// OF GOODWILL, LOSS OF PROFITS, LOSS OF SAVINGS, OR LOSS OF
// USE OR INTERRUPTION OF BUSINESS. IN NO EVENT WILL TI'S
// AGGREGATE LIABILITY UNDER THIS AGREEMENT OR ARISING OUT OF
// YOUR USE OF THE PROGRAM EXCEED FIVE HUNDRED DOLLARS
// (U.S.$500).
//
// Unless otherwise stated, the Program written and copyrighted
// by Texas Instruments is distributed as "freeware".  You may,
// only under TI's copyright in the Program, use and modify the
// Program without any charge or restriction.  You may
// distribute to third parties, provided that you transfer a
// copy of this license to the third party and the third party
// agrees to these terms by its first use of the Program. You
// must reproduce the copyright notice and any other legend of
// ownership on each copy or partial copy, of the Program.
//
// You acknowledge and agree that the Program contains
// copyrighted material, trade secrets and other TI proprietary
// information and is protected by copyright laws,
// international copyright treaties, and trade secret laws, as
// well as other intellectual property laws.  To protect TI's
// rights in the Program, you agree not to decompile, reverse
// engineer, disassemble or otherwise translate any object code
// versions of the Program to a human-readable form.  You agree
// that in no event will you alter, remove or destroy any
// copyright notice included in the Program.  TI reserves all
// rights not specifically granted under this license. Except
// as specifically provided herein, nothing in this agreement
// shall be construed as conferring by implication, estoppel,
// or otherwise, upon you, any license or other right under any
// TI patents, copyrights or trade secrets.
//
// You may not use the Program in non-TI devices.
//*****************************************************************************
#include  <msp430xG43x.h>
#include "math.h"
//defines
#define PB_2_0 (1 << 0)                     // Push Button on P2.0
#define PB_2_1 (1 << 1)                     // Push Button on P2.1

// variables declaration
static char beats;
int i=0, first_detection=0;
long result = 0;
int Datain, Dataout, Dataout_pulse, pulseperiod, counter, heartrate;
int Heart_Rate_Buffer[] = {0,0,0,0};
// Lowpass FIR filter coefficients for 17 taps to filter > 30Hz
static const int coeffslp[9] = {
     5225, 5175, 7255, 9453, 11595, 13507, 15016, 15983, 16315 };
// Highpass FIR filter coefficients for 17 taps to filter < 2Hz
static const int coeffshp[9] = {
     -763, -1267, -1091, -1867, -1969, -2507, -2619, -2911, 29908 };

// *******************************************
// Definitions related to Olimex LCD Digits!!!!
// *******************************************
// Definitions for Olimex LCD digits 10 and 11
#define a 0x10
#define b 0x01
#define c 0x04
#define d 0x08
#define e 0x40
#define f 0x20
#define g 0x02
#define h 0x80
// Character generator definition for display digits 10 and 11
const char char_gen_10_11[] = {
    a+b+c+d+e+f,                            // 0 Displays "0"
    b+c,                                    // 1 Displays "1"
    a+b+d+e+g,                              // 2 Displays "2"
    a+b+c+d+g,                              // 3 Displays "3"
    b+c+f+g,                                // 4 Displays "4"
    a+c+d+f+g,                              // 5 Displays "5"
    a+c+d+e+f+g,                            // 6 Displays "6"
    a+b+c,                                  // 7 Displays "7"
    a+b+c+d+e+f+g,                          // 8 Displays "8"
    a+b+c+d+f+g,                            // 9 Displays "9"
};
// undefines
#undef a
#undef b
#undef c
#undef d
#undef e
#undef f
#undef g
#undef h

// Definitions for Olimex LCD digits 8 and 9
#define a 0x01
#define b 0x02
#define c 0x04
#define d 0x80
#define e 0x40
#define f 0x10
#define g 0x20
#define h 0x08
// Character generator definition for display digits 8 and 9
const char char_gen_8_9[] = {
    a+b+c+d+e+f,                            // 0 Displays "0"
    b+c,                                    // 1 Displays "1"
    a+b+d+e+g,                              // 2 Displays "2"
    a+b+c+d+g,                              // 3 Displays "3"
    b+c+f+g,                                // 4 Displays "4"
    a+c+d+f+g,                              // 5 Displays "5"
    a+c+d+e+f+g,                            // 6 Displays "6"
    a+b+c,                                  // 7 Displays "7"
    a+b+c+d+e+f+g,                          // 8 Displays "8"
    a+b+c+d+f+g,                            // 9 Displays "9"
};
// undefines
#undef a
#undef b
#undef c
#undef d
#undef e
#undef f
#undef g
#undef h

// Definitions for Olimex LCD digits 1 to 7. Here each digit definition require 2 bytes
#define a 0x0080
#define b 0x0040
#define c 0x0020
#define d 0x0010
#define e 0x2000
#define f 0x4000
#define g 0x0402
#define h 0x1000
// Character generator definition for display digits 1 to 7
const int char_gen_1_7[] = {
    a+b+c+d+e+f,                            // 0 Displays "0"
    b+c,                                    // 1 Displays "1"
    a+b+d+e+g,                              // 2 Displays "2"
    a+b+c+d+g,                              // 3 Displays "3"
    b+c+f+g,                                // 4 Displays "4"
    a+c+d+f+g,                              // 5 Displays "5"
    a+c+d+e+f+g,                            // 6 Displays "6"
    a+b+c,                                  // 7 Displays "7"
    a+b+c+d+e+f+g,                          // 8 Displays "8"
    a+b+c+d+f+g,                            // 9 Displays "9"
};
// undefines
#undef a
#undef b
#undef c
#undef d
#undef e
#undef f
#undef g
#undef h



// function prototypes
void Init(void);                            // Initializes device for the application
void ClearLCD(void);                        // Clears the LCD memory
int filterlp(int);                          // 17 tap lowpass FIR filter
int filterhp(int);                          // 17 tap highpass FIR filter
long mul16(register int x, register int y); // 16-bit signed multiplication
int itobcd(int i);                          // 16-bit hex to bcd conversion
// main function
void main(void)
{ 
  Init();                                   // Initialize device for the application
  LCDMEM[7] = 0x80;                         // Turn on LCD's Olimex row!!!

/* 
  // For debug purpose only!
  for(unsigned char j=0;j<10;j++){
    LCDMEM[2] = char_gen_10_11[j];                  // LCD -> Digit 11
    LCDMEM[3] = char_gen_10_11[j];                  // LCD -> Digit 10
    LCDMEM[4] = char_gen_8_9[j];                    // LCD -> Digit 9
    LCDMEM[5] = char_gen_8_9[j];                    // LCD -> Digit 8
    
    LCDMEM[7] = ((char)(char_gen_1_7[j]>>8));       // LCD -> Digit 7 High Byte
    LCDMEM[6] = ((char)(char_gen_1_7[j]&0x00FF));   // LCD -> Digit 7 Low Byte
    LCDMEM[9] = ((char)(char_gen_1_7[j]>>8));       // LCD -> Digit 6 High Byte
    LCDMEM[8] = ((char)(char_gen_1_7[j]&0x00FF));   // LCD -> Digit 6 Low Byte
    LCDMEM[11] = ((char)(char_gen_1_7[j]>>8));      // LCD -> Digit 5 High Byte
    LCDMEM[10] = ((char)(char_gen_1_7[j]&0x00FF));  // LCD -> Digit 5 Low Byte
    //LCDMEM[13] = ((char)(char_gen_1_7[j]>>8));      // LCD -> Digit 4 High Byte
    //LCDMEM[12] = ((char)(char_gen_1_7[j]&0x00FF));  // LCD -> Digit 4 Low Byte
    //LCDMEM[15] = ((char)(char_gen_1_7[j]>>8));      // LCD -> Digit 3 High Byte
    //LCDMEM[14] = ((char)(char_gen_1_7[j]&0x00FF));  // LCD -> Digit 3 Low Byte
    //LCDMEM[17] = ((char)(char_gen_1_7[j]>>8));      // LCD -> Digit 2 High Byte
    //LCDMEM[16] = ((char)(char_gen_1_7[j]&0x00FF));  // LCD -> Digit 2 Low Byte
  }
*/
  
  while(1)
  {
    __bis_SR_register(LPM0_bits);           // Enter LPM0 needed for UART TX completion
    __no_operation(); 
    
    Dataout = filterlp(Datain);             // Lowpass FIR filter for filtering out 60Hz
    Dataout_pulse = filterhp(Dataout)-128;  // Highpass FIR filter to filter muscle artifacts
    Dataout = Dataout >> 6;                 // Scale Dataout to use scope program
    if(Dataout > 255) Dataout = 255;        // Set boundary 255 max       
    if(Dataout < 0)   Dataout =   0;        // Set boundary 0 min         
    //DAC12_0DAT = Dataout;                 // For scope display          
    TXBUF0 = Dataout;                       // Transmit via UART0 for Scope display
    counter++;                              // Debounce counter
    pulseperiod++;                          // Pulse period counter
    if (Dataout_pulse > 100)                 // Check if above threshold (48)
    { 
      LCDMEM[1] = 0xF0;                     // Heart beat detected enable "<^>" on LCD
      counter = 0;                          // Reset debounce counter
    }                                            
    if (counter == 128)                     // Allow 128 sample debounce time
    {
      LCDMEM[1] = 0x00;                     // Disable "<^>" on LCD for blinking effect
      beats++;    
      if (beats == 3)
      {
        beats = 0;
        // heartrate = itobcd(30720/pulseperiod);  // Calculate beat to beat heart rate per min
        heartrate = itobcd(92160/pulseperiod);                  // Calculate 3 beat average heart rate per min
        //heartrate = (92160/pulseperiod);                        // Calculate 3 beat average heart rate per min
        pulseperiod = 0;                                        // Reset pulse period for next measurement
        ///*
        LCDMEM[2] = char_gen_10_11[heartrate & 0x0f];           // Display current heart rate units     -> LCD Digit 11
        LCDMEM[3] = char_gen_10_11[(heartrate & 0xf0) >> 4];    // tens                                 -> LCD Digit 10
        LCDMEM[4] = char_gen_8_9[(heartrate & 0xf00) >> 8];     // hundreds                             -> LCD Digit 9
        
        LCDMEM[7] = ((char)(char_gen_1_7[heartrate & 0x0f]>>8));                // LCD -> Digit 7 High Byte
        LCDMEM[6] = ((char)(char_gen_1_7[heartrate & 0x0f]&0x00FF));            // LCD -> Digit 7 Low Byte
        LCDMEM[9] = ((char)(char_gen_1_7[((heartrate & 0xf0) >> 4)]>>8));       // LCD -> Digit 6 High Byte
        LCDMEM[8] = ((char)(char_gen_1_7[((heartrate & 0xf0) >> 4)]&0x00FF));   // LCD -> Digit 6 Low Byte
        LCDMEM[11] = ((char)(char_gen_1_7[((heartrate & 0xf00) >> 8)]>>8));     // LCD -> Digit 5 High Byte
        LCDMEM[10] = ((char)(char_gen_1_7[((heartrate & 0xf00) >> 8)]&0x00FF)); // LCD -> Digit 5 Low Byte
        //*/     
  
      }
    } 
  }
}//main

// Initialization function
void Init( void )
{ 
  FLL_CTL0 |= XCAP10PF;                     // Set load capacitance for xtal  
  WDTCTL = WDTPW | WDTHOLD;                 // Disable the Watchdog
  while ( LFOF & FLL_CTL0);                 // wait for watch crystal to stabilize
  SCFQCTL = 63;                             // 32 x 32768 x 2 = 2.097152MHz
  BTCTL = BT_fLCD_DIV128;                   // Set LCD frame freq = ACLK/128
// Initialize and enable LCD peripheral
  ClearLCD();                               // Clear LCD memory
  LCDCTL = LCDSG0_3 + LCD4MUX + LCDON ;     // 4mux LCD, segs0-23 enabled
// Initialize and enable GPIO ports
  P1OUT = 0x00 + BIT3;                      // Clear P1OUT register, INA turned ON
  P1DIR = 0x3f;                             // Unused pins as outputs, Comparator pins as inputs
  P2OUT = 0x00;                             // Clear P2OUT register
  P2DIR = 0xff;                             // Unused pins as outputs
  P2DIR = ~(PB_2_0+PB_2_1);                 // P2.0 and P2.1 push buttons
  P2IES = 0x00;                             // Interrupt edge low to high transition
  P2IFG = 0x00;                             // Clear pending P2 interrupts
  P2IE = PB_2_0 | PB_2_1;                   // Enable intterupts for push buttons
  P3OUT = 0x00;                             // Clear P3OUT register
  P3DIR = 0x0f;                             // Unused pins as outputs except P3.<4-7> -> For the new LCD's received at ~04.10.2012 this must be inputs!!
  P4OUT = 0x00;                             // Clear P4OUT register
  P4DIR = 0xff;                             // Unused pins as outputs
  P5OUT = 0x00;                             // Clear P5OUT register
  P5DIR = 0xff;                             // Unused pins as outputs
  P5SEL = 0xfc;                             // Set Rxx and COM pins for LCD
  P6OUT = 0x00;                             // Clear P6OUT register
  P6SEL = 0xff;                             // P6 = Analog
// Initialize and enable UART
  P2SEL|=BIT4;                              // P2.4 = TXD
  UCTL0 |= SWRST;                           // UART SWRST = 1
  ME1 |= UTXE0;                             // Enable UART0 TXD
  UCTL0 |= CHAR;                            // 8-bit char, SWRST=1
  UTCTL0 |= SSEL1;                          // UCLK = SMCLK
  UBR00 = 18;                               // 115200 from 2.097152MHz
  UBR10 = 0;
  UMCTL0 = 0x2c;                            // Modulation = 0.2044
  UCTL0 &= ~SWRST;                          // UART SWRST = 0, enable UART
// Initialize and enable ADC12
  ADC12CTL0 = ADC12ON + SHT0_4 + REFON + REF2_5V; 
                                            // ADC12 ON, Reference = 2.5V for DAC0        
  ADC12CTL1 = SHP + SHS_1 + CONSEQ_2;       // Use sampling timer, TA1 trigger
  ADC12MCTL0 = INCH_1 + SREF_1;             // Vref, channel = 1 = OA0 Out
  ADC12IE = BIT0;                           // Enable interrupt for ADC12 MEM0
  ADC12CTL0 |= ENC;                         // Enable conversions
// Initialize and enable Timer_A
  TACTL = TASSEL0 + MC_1 + TACLR;           // ACLK, Clear TAR, Up Mode
  TACCTL1 = OUTMOD_2;                       // Set / Reset
  TACCR0 = 63;                              // 512 samples per second
  TACCR1 = 15;                              //
// Initialize and enable DAC12x
  DAC12_0CTL = DAC12OPS + DAC12CALON + DAC12IR + DAC12AMP_2 + DAC12ENC;// DAC0 enable
  DAC12_1CTL = DAC12CALON + DAC12IR + DAC12AMP_2 + DAC12ENC;           // DAC1 enable
  DAC12_1DAT = 0x099A;                      // Offset level = 1.5V for op amp bias
// Initialize and enable opamps
  OA0CTL0 = OAP_1 + OAPM_1 + OAADC1;        // OA0 enable power mode 1, OA0- = P6.0, 0A0+ = P6.2, OA0O = P6.1
  OA0CTL1 = OARRIP;                         // General purpose mode, no Rail-to-Rail inputs
  OA1CTL0 = OAP_3 + OAPM_1 + OAADC1;        // OA1 enable power mode 1, OA1- = P6.4, OA1+ = DAC1, OA1O = P6.3
  OA1CTL1 = OARRIP;                         // General purpose mode, no Rail-to-Rail inputs
  OA2CTL0 = OAP_3 + OAPM_1 + OAADC1;        // OA2 enable power mode 1, OA2+ = DAC1, OA2O = P6.5, Select inputs, power mode
  OA2CTL1 = OAFC_1 + OARRIP;                // Unit gain Mode, no Rail-to-Rail inputs
  __enable_interrupt();                     // Enable global Interrupts
} //init

void ClearLCD(void)
{   
  int i;                                    //
  for( i = 0; i < 20; i++){                 // Clear LCDMEM
    LCDMEM[i] = 0;                          //
  }
}//clear LCD

int itobcd(int i)                           // Convert hex word to BCD.
{   
  int bcd = 0;                              //
  char j = 0;                               //
  
  while (i > 9)                             //
  {
    bcd |= ((i % 10) << j);                 //
    i /= 10;                                //
    j += 4;
  }                                         //
  return (bcd | (i << j));                  // Return converted value
}// itobcd(i)


int filterlp(int sample)                    // Lowpass FIR filter for EKG
{ 
  static int buflp[32];                     // Reserve 32 loactions for circular buffering
  static int offsetlp = 0;
  long z;
  int i;

  buflp[offsetlp] = sample;
  z = mul16(coeffslp[8], buflp[(offsetlp - 8) & 0x1F]);
  
  __no_operation();
  
  for (i = 0;  i < 8;  i++){
    z += mul16(coeffslp[i], buflp[(offsetlp - i) & 0x1F] + buflp[(offsetlp - 16 + i) & 0x1F]);
  }
  
  offsetlp = (offsetlp + 1) & 0x1F;
  return  z >> 15;                          // Return filter output
}// int filter

int filterhp(int samplehp)                  // Highpass FIR filter for hear rate
{   
  static int bufhp[32];                     // Reserve 32 loactions for circular buffering
  static int offsethp = 0;
  long z;
  int i;

  bufhp[offsethp] = samplehp;
  z = mul16(coeffshp[8], bufhp[(offsethp - 8) & 0x1F]);

  for (i = 0;  i < 8;  i++){
    z += mul16(coeffshp[i], bufhp[(offsethp - i) & 0x1F] + bufhp[(offsethp - 16 + i) & 0x1F]);
  }
  
  offsethp = (offsethp + 1) & 0x1F;
  return  z >> 15;                          // Return filter output
}// int filterhp

#pragma vector = PORT2_VECTOR
__interrupt void Port2ISR (void)
{   
  P2IFG = 0;
}//Push buttons unused

#pragma vector = ADC_VECTOR                 // ADC12 ISR
__interrupt void ADC12ISR (void)
{   
  Datain = ADC12MEM0;                       // Store converted value in Datain
  __bic_SR_register_on_exit(LPM0_bits);     // Exit LPM0 on return
}// ADC12ISR


