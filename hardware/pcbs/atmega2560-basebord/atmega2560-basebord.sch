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
LIBS:atmega2560-basebord-cache
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
P 2300 3900
F 0 "U?" H 1150 6700 50  0000 L BNN
F 1 "ATMEGA2560-16AU" H 3000 1050 50  0000 L BNN
F 2 "TQFP100" H 2300 3900 50  0001 C CIN
F 3 "" H 2300 3900 50  0001 C CNN
	1    2300 3900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5B4B88FD
P 1650 900
F 0 "#PWR?" H 1650 750 50  0001 C CNN
F 1 "+5V" H 1650 1040 50  0000 C CNN
F 2 "" H 1650 900 50  0001 C CNN
F 3 "" H 1650 900 50  0001 C CNN
	1    1650 900 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B4B89DB
P 1900 6950
F 0 "#PWR?" H 1900 6700 50  0001 C CNN
F 1 "GND" H 1900 6800 50  0000 C CNN
F 2 "" H 1900 6950 50  0001 C CNN
F 3 "" H 1900 6950 50  0001 C CNN
	1    1900 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 900  1650 950 
Wire Wire Line
	1650 950  2450 950 
Wire Wire Line
	1950 950  1950 1000
Wire Wire Line
	2050 950  2050 1000
Connection ~ 1950 950 
Wire Wire Line
	2150 950  2150 1000
Connection ~ 2050 950 
Wire Wire Line
	2250 950  2250 1000
Connection ~ 2150 950 
Wire Wire Line
	2450 950  2450 1000
Connection ~ 2250 950 
Wire Wire Line
	1900 6950 1900 6850
Wire Wire Line
	1900 6850 2550 6850
Wire Wire Line
	2150 6850 2150 6800
Wire Wire Line
	2250 6850 2250 6800
Connection ~ 2150 6850
Wire Wire Line
	2350 6850 2350 6800
Connection ~ 2250 6850
Wire Wire Line
	2450 6850 2450 6800
Connection ~ 2350 6850
Wire Wire Line
	2550 6850 2550 6800
Connection ~ 2450 6850
$Comp
L C C?
U 1 1 5B4B95A0
P 4850 1650
F 0 "C?" H 4875 1750 50  0000 L CNN
F 1 "0.1uF" H 4875 1550 50  0000 L CNN
F 2 "" H 4888 1500 50  0001 C CNN
F 3 "" H 4850 1650 50  0001 C CNN
	1    4850 1650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B961F
P 5350 1650
F 0 "C?" H 5375 1750 50  0000 L CNN
F 1 "0.1uF" H 5375 1550 50  0000 L CNN
F 2 "" H 5388 1500 50  0001 C CNN
F 3 "" H 5350 1650 50  0001 C CNN
	1    5350 1650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5B4B9643
P 5800 1650
F 0 "C?" H 5825 1750 50  0000 L CNN
F 1 "0.1uF" H 5825 1550 50  0000 L CNN
F 2 "" H 5838 1500 50  0001 C CNN
F 3 "" H 5800 1650 50  0001 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1500 4850 1350
Wire Wire Line
	4850 1350 5800 1350
Wire Wire Line
	5350 1150 5350 1500
Wire Wire Line
	5800 1350 5800 1500
Connection ~ 5350 1350
Wire Wire Line
	5800 1950 5800 1800
Wire Wire Line
	4850 1950 5800 1950
Wire Wire Line
	5350 1800 5350 2100
Wire Wire Line
	4850 1950 4850 1800
Connection ~ 5350 1950
$Comp
L GND #PWR?
U 1 1 5B4B9704
P 5350 2100
F 0 "#PWR?" H 5350 1850 50  0001 C CNN
F 1 "GND" H 5350 1950 50  0000 C CNN
F 2 "" H 5350 2100 50  0001 C CNN
F 3 "" H 5350 2100 50  0001 C CNN
	1    5350 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5B4B974E
P 5350 1150
F 0 "#PWR?" H 5350 1000 50  0001 C CNN
F 1 "+5V" H 5350 1290 50  0000 C CNN
F 2 "" H 5350 1150 50  0001 C CNN
F 3 "" H 5350 1150 50  0001 C CNN
	1    5350 1150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
