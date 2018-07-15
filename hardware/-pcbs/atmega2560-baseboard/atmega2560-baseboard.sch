EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Atmega2560 Baseboard"
Date "2018-07-15"
Rev "0.1"
Comp "www.aravinth.info"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA2560-16AU U?
U 1 1 5B4B7E8F
P 2550 3750
F 0 "U?" H 1400 6550 50  0000 L BNN
F 1 "ATMEGA2560-16AU" H 3250 900 50  0000 L BNN
F 2 "TQFP100" H 2550 3750 50  0001 C CIN
F 3 "" H 2550 3750 50  0001 C CNN
	1    2550 3750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 5B4B88FD
P 1900 750
F 0 "#PWR01" H 1900 600 50  0001 C CNN
F 1 "+5V" H 1900 890 50  0000 C CNN
F 2 "" H 1900 750 50  0001 C CNN
F 3 "" H 1900 750 50  0001 C CNN
	1    1900 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5B4B89DB
P 2150 6800
F 0 "#PWR02" H 2150 6550 50  0001 C CNN
F 1 "GND" H 2150 6650 50  0000 C CNN
F 2 "" H 2150 6800 50  0001 C CNN
F 3 "" H 2150 6800 50  0001 C CNN
	1    2150 6800
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B95A0
P 9150 1400
F 0 "C?" H 9175 1500 50  0000 L CNN
F 1 "0.1uF" H 9175 1300 50  0000 L CNN
F 2 "" H 9188 1250 50  0001 C CNN
F 3 "" H 9150 1400 50  0001 C CNN
	1    9150 1400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B961F
P 9650 1400
F 0 "C?" H 9675 1500 50  0000 L CNN
F 1 "0.1uF" H 9675 1300 50  0000 L CNN
F 2 "" H 9688 1250 50  0001 C CNN
F 3 "" H 9650 1400 50  0001 C CNN
	1    9650 1400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B9643
P 10100 1400
F 0 "C?" H 10125 1500 50  0000 L CNN
F 1 "0.1uF" H 10125 1300 50  0000 L CNN
F 2 "" H 10138 1250 50  0001 C CNN
F 3 "" H 10100 1400 50  0001 C CNN
	1    10100 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5B4B9704
P 9650 1850
F 0 "#PWR03" H 9650 1600 50  0001 C CNN
F 1 "GND" H 9650 1700 50  0000 C CNN
F 2 "" H 9650 1850 50  0001 C CNN
F 3 "" H 9650 1850 50  0001 C CNN
	1    9650 1850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 5B4B974E
P 9650 900
F 0 "#PWR04" H 9650 750 50  0001 C CNN
F 1 "+5V" H 9650 1040 50  0000 C CNN
F 2 "" H 9650 900 50  0001 C CNN
F 3 "" H 9650 900 50  0001 C CNN
	1    9650 900 
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5B4B9879
P 9350 2750
F 0 "R?" V 9430 2750 50  0000 C CNN
F 1 "10K" V 9350 2750 50  0000 C CNN
F 2 "" V 9280 2750 50  0001 C CNN
F 3 "" H 9350 2750 50  0001 C CNN
	1    9350 2750
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR05
U 1 1 5B4B9915
P 8900 2650
F 0 "#PWR05" H 8900 2500 50  0001 C CNN
F 1 "+5V" H 8900 2790 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B996D
P 9700 3100
F 0 "C?" H 9725 3200 50  0000 L CNN
F 1 "22p" H 9725 3000 50  0000 L CNN
F 2 "" H 9738 2950 50  0001 C CNN
F 3 "" H 9700 3100 50  0001 C CNN
	1    9700 3100
	1    0    0    -1  
$EndComp
$Comp
L Resonator XTAL
U 1 1 5B4BA4AC
P 9650 4450
F 0 "XTAL" H 9650 4675 50  0000 C CNN
F 1 "16M" H 9650 4600 50  0000 C CNN
F 2 "" H 9625 4450 50  0001 C CNN
F 3 "" H 9625 4450 50  0001 C CNN
	1    9650 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5B4BA60D
P 9650 4800
F 0 "#PWR06" H 9650 4550 50  0001 C CNN
F 1 "GND" H 9650 4650 50  0000 C CNN
F 2 "" H 9650 4800 50  0001 C CNN
F 3 "" H 9650 4800 50  0001 C CNN
	1    9650 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5B4BA98E
P 9700 3400
F 0 "#PWR07" H 9700 3150 50  0001 C CNN
F 1 "GND" H 9700 3250 50  0000 C CNN
F 2 "" H 9700 3400 50  0001 C CNN
F 3 "" H 9700 3400 50  0001 C CNN
	1    9700 3400
	1    0    0    -1  
$EndComp
$Comp
L D D?
U 1 1 5B4BAB03
P 9350 2450
F 0 "D?" H 9350 2550 50  0000 C CNN
F 1 "D" H 9350 2350 50  0000 C CNN
F 2 "" H 9350 2450 50  0001 C CNN
F 3 "" H 9350 2450 50  0001 C CNN
	1    9350 2450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 5B4BB470
P 9100 6000
F 0 "#PWR08" H 9100 5850 50  0001 C CNN
F 1 "+5V" H 9100 6140 50  0000 C CNN
F 2 "" H 9100 6000 50  0001 C CNN
F 3 "" H 9100 6000 50  0001 C CNN
	1    9100 6000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5B4BB53C
P 9500 6100
F 0 "R?" V 9580 6100 50  0000 C CNN
F 1 "10K" V 9500 6100 50  0000 C CNN
F 2 "" V 9430 6100 50  0001 C CNN
F 3 "" H 9500 6100 50  0001 C CNN
	1    9500 6100
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 5B4BB5F6
P 9950 6100
F 0 "D?" H 9950 6200 50  0000 C CNN
F 1 "LED" H 9950 6000 50  0000 C CNN
F 2 "" H 9950 6100 50  0001 C CNN
F 3 "" H 9950 6100 50  0001 C CNN
	1    9950 6100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR09
U 1 1 5B4BB694
P 10450 6150
F 0 "#PWR09" H 10450 5900 50  0001 C CNN
F 1 "GND" H 10450 6000 50  0000 C CNN
F 2 "" H 10450 6150 50  0001 C CNN
F 3 "" H 10450 6150 50  0001 C CNN
	1    10450 6150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5B4BB801
P 9500 5550
F 0 "R?" V 9580 5550 50  0000 C CNN
F 1 "10K" V 9500 5550 50  0000 C CNN
F 2 "" V 9430 5550 50  0001 C CNN
F 3 "" H 9500 5550 50  0001 C CNN
	1    9500 5550
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 5B4BB809
P 9950 5550
F 0 "D?" H 9950 5650 50  0000 C CNN
F 1 "LED" H 9950 5450 50  0000 C CNN
F 2 "" H 9950 5550 50  0001 C CNN
F 3 "" H 9950 5550 50  0001 C CNN
	1    9950 5550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR010
U 1 1 5B4BB810
P 10450 5600
F 0 "#PWR010" H 10450 5350 50  0001 C CNN
F 1 "GND" H 10450 5450 50  0000 C CNN
F 2 "" H 10450 5600 50  0001 C CNN
F 3 "" H 10450 5600 50  0001 C CNN
	1    10450 5600
	1    0    0    -1  
$EndComp
Text Label 9100 5450 0    60   ~ 0
13
Text Label 950  4850 0    60   ~ 0
13
$Comp
L R_Small R?
U 1 1 5B4BC2EE
P 9650 4050
F 0 "R?" H 9680 4070 50  0000 L CNN
F 1 "1M" H 9680 4010 50  0000 L CNN
F 2 "" H 9650 4050 50  0001 C CNN
F 3 "" H 9650 4050 50  0001 C CNN
	1    9650 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 750  1900 800 
Wire Wire Line
	1900 800  2700 800 
Wire Wire Line
	2200 800  2200 850 
Wire Wire Line
	2300 800  2300 850 
Connection ~ 2200 800 
Wire Wire Line
	2400 800  2400 850 
Connection ~ 2300 800 
Wire Wire Line
	2500 800  2500 850 
Connection ~ 2400 800 
Wire Wire Line
	2700 800  2700 850 
Connection ~ 2500 800 
Wire Wire Line
	2150 6800 2150 6700
Wire Wire Line
	2150 6700 2800 6700
Wire Wire Line
	2400 6700 2400 6650
Wire Wire Line
	2500 6700 2500 6650
Connection ~ 2400 6700
Wire Wire Line
	2600 6700 2600 6650
Connection ~ 2500 6700
Wire Wire Line
	2700 6700 2700 6650
Connection ~ 2600 6700
Wire Wire Line
	2800 6700 2800 6650
Connection ~ 2700 6700
Wire Wire Line
	9150 1250 9150 1100
Wire Wire Line
	9150 1100 10100 1100
Wire Wire Line
	9650 900  9650 1250
Wire Wire Line
	10100 1100 10100 1250
Connection ~ 9650 1100
Wire Wire Line
	10100 1700 10100 1550
Wire Wire Line
	9150 1700 10100 1700
Wire Wire Line
	9650 1550 9650 1850
Wire Wire Line
	9150 1700 9150 1550
Connection ~ 9650 1700
Wire Wire Line
	8900 2650 8900 2750
Wire Wire Line
	8900 2750 9200 2750
Wire Wire Line
	9500 2750 10100 2750
Wire Wire Line
	9700 2750 9700 2950
Connection ~ 9700 2750
Wire Notes Line
	8200 6500 8200 550 
Wire Wire Line
	9100 4450 9500 4450
Wire Wire Line
	9800 4450 10200 4450
Wire Wire Line
	1100 1450 1250 1450
Wire Wire Line
	1100 1750 1250 1750
Wire Wire Line
	9500 2450 9600 2450
Wire Wire Line
	9600 2450 9600 2750
Connection ~ 9600 2750
Wire Wire Line
	9200 2450 9100 2450
Wire Wire Line
	9100 2450 9100 2750
Connection ~ 9100 2750
Wire Wire Line
	1250 1150 1100 1150
Wire Notes Line
	8250 2150 11100 2150
Wire Notes Line
	8300 3800 11100 3800
Wire Notes Line
	8350 5050 11100 5050
Wire Wire Line
	9100 6000 9100 6100
Wire Wire Line
	9100 6100 9350 6100
Wire Wire Line
	9800 6100 9650 6100
Wire Wire Line
	10100 6100 10450 6100
Wire Wire Line
	10450 6100 10450 6150
Wire Wire Line
	9100 5450 9100 5550
Wire Wire Line
	9100 5550 9350 5550
Wire Wire Line
	9800 5550 9650 5550
Wire Wire Line
	10100 5550 10450 5550
Wire Wire Line
	10450 5550 10450 5600
Wire Wire Line
	950  4850 1250 4850
Wire Wire Line
	9650 4650 9650 4800
Wire Wire Line
	9700 3400 9700 3250
Wire Wire Line
	9450 4450 9450 4050
Wire Wire Line
	9450 4050 9550 4050
Connection ~ 9450 4450
Wire Wire Line
	9850 4450 9850 4050
Wire Wire Line
	9850 4050 9750 4050
Connection ~ 9850 4450
$Comp
L C_Small C?
U 1 1 5B4BC746
P 1100 6550
F 0 "C?" H 1110 6620 50  0000 L CNN
F 1 "0.1uf" H 1110 6470 50  0000 L CNN
F 2 "" H 1100 6550 50  0001 C CNN
F 3 "" H 1100 6550 50  0001 C CNN
	1    1100 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6450 1100 6350
Wire Wire Line
	950  6350 1250 6350
$Comp
L GND #PWR?
U 1 1 5B4BC854
P 1100 6800
F 0 "#PWR?" H 1100 6550 50  0001 C CNN
F 1 "GND" H 1100 6650 50  0000 C CNN
F 2 "" H 1100 6800 50  0001 C CNN
F 3 "" H 1100 6800 50  0001 C CNN
	1    1100 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6650 1100 6800
Text Label 950  6350 2    60   ~ 0
AREF
Connection ~ 1100 6350
$Comp
L Conn_02x12_Counter_Clockwise J?
U 1 1 5B4BCB03
P 6050 1550
F 0 "J?" H 6100 2150 50  0000 C CNN
F 1 "Bottom" H 6100 850 50  0000 C CNN
F 2 "" H 6050 1550 50  0001 C CNN
F 3 "" H 6050 1550 50  0001 C CNN
	1    6050 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5B4BD295
P 5800 1050
F 0 "#PWR?" H 5800 900 50  0001 C CNN
F 1 "+5V" H 5800 1190 50  0000 C CNN
F 2 "" H 5800 1050 50  0001 C CNN
F 3 "" H 5800 1050 50  0001 C CNN
	1    5800 1050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5B4BD34B
P 5650 1150
F 0 "#PWR?" H 5650 900 50  0001 C CNN
F 1 "GND" H 5650 1000 50  0000 C CNN
F 2 "" H 5650 1150 50  0001 C CNN
F 3 "" H 5650 1150 50  0001 C CNN
	1    5650 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 1050 5850 1050
Wire Wire Line
	5650 1150 5850 1150
Text Label 5800 1750 2    60   ~ 0
TX
Text Label 5800 1850 2    60   ~ 0
RX
Wire Wire Line
	5800 1350 5850 1350
Wire Wire Line
	5800 1450 5850 1450
Text Label 5800 1450 2    60   ~ 0
SCK
Wire Wire Line
	5800 1550 5850 1550
Text Label 5800 1550 2    60   ~ 0
MISO
Wire Wire Line
	5800 1650 5850 1650
Text Label 5800 1650 2    60   ~ 0
MOSI
Wire Wire Line
	5800 1750 5850 1750
Text Label 5800 1950 2    60   ~ 0
SDA
Wire Wire Line
	5800 1850 5850 1850
Text Label 5800 2050 2    60   ~ 0
SCL
Wire Wire Line
	5800 1950 5850 1950
Text Label 5800 1350 2    60   ~ 0
RESET
$Comp
L +3.3V #PWR?
U 1 1 5B4BE9E2
P 5350 1250
F 0 "#PWR?" H 5350 1100 50  0001 C CNN
F 1 "+3.3V" H 5350 1390 50  0000 C CNN
F 2 "" H 5350 1250 50  0001 C CNN
F 3 "" H 5350 1250 50  0001 C CNN
	1    5350 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 1250 5850 1250
Text Label 1100 1150 2    60   ~ 0
RESET
Text Label 1100 1450 2    60   ~ 0
XTAL2
Text Label 1100 1750 2    60   ~ 0
XTAL1
Text Label 9100 4450 2    60   ~ 0
XTAL1
Text Label 10200 4450 0    60   ~ 0
XTAL2
Text Label 10100 2750 0    60   ~ 0
RESET
Text Label 5850 2150 2    60   ~ 0
AREF
$EndSCHEMATC
