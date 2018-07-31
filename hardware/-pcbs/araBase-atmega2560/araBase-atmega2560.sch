EESchema Schematic File Version 4
LIBS:araBase-atmega2560-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBase-atmega2560"
Date "2018-07-31"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Baseboard for Atmega2560"
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega2560-16AU U1
U 1 1 5B609FCF
P 2200 3950
F 0 "U1" H 2800 1150 50  0000 C CNN
F 1 "ATmega2560-16AU" H 1700 1100 50  0000 C CNN
F 2 "Package_QFP:TQFP-100_14x14mm_P0.5mm" H 2200 3950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bit-AVR-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf" H 2200 3950 50  0001 C CNN
	1    2200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5B60EEBB
P 1900 900
F 0 "#PWR0101" H 1900 750 50  0001 C CNN
F 1 "+5V" H 1915 1073 50  0000 C CNN
F 2 "" H 1900 900 50  0001 C CNN
F 3 "" H 1900 900 50  0001 C CNN
	1    1900 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1050 2200 1000
Wire Wire Line
	2200 1000 1900 1000
Wire Wire Line
	1900 1000 1900 900 
Wire Wire Line
	2200 1000 2300 1000
Wire Wire Line
	2300 1000 2300 1050
Connection ~ 2200 1000
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5B60F092
P 1600 900
F 0 "#FLG0101" H 1600 975 50  0001 C CNN
F 1 "PWR_FLAG" H 1600 1074 50  0000 C CNN
F 2 "" H 1600 900 50  0001 C CNN
F 3 "~" H 1600 900 50  0001 C CNN
	1    1600 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 900  1600 1000
Wire Wire Line
	1600 1000 1900 1000
Connection ~ 1900 1000
$Comp
L power:GND #PWR0102
U 1 1 5B60F283
P 2200 7050
F 0 "#PWR0102" H 2200 6800 50  0001 C CNN
F 1 "GND" H 2205 6877 50  0000 C CNN
F 2 "" H 2200 7050 50  0001 C CNN
F 3 "" H 2200 7050 50  0001 C CNN
	1    2200 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 7050 2200 7000
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5B60F2EC
P 2550 7050
F 0 "#FLG0102" H 2550 7125 50  0001 C CNN
F 1 "PWR_FLAG" H 2550 7223 50  0000 C CNN
F 2 "" H 2550 7050 50  0001 C CNN
F 3 "~" H 2550 7050 50  0001 C CNN
	1    2550 7050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 7050 2550 7000
Wire Wire Line
	2550 7000 2200 7000
Connection ~ 2200 7000
Wire Wire Line
	2200 7000 2200 6850
Text Label 1400 1350 2    50   ~ 0
RESET
Text Label 1400 1750 2    50   ~ 0
XTAL2
Text Label 1400 1550 2    50   ~ 0
XTAL1
Text Label 1400 5050 2    50   ~ 0
D13
Text Label 1400 5250 2    50   ~ 0
D6
Text Label 1400 5350 2    50   ~ 0
D7
Text Label 1400 6350 2    50   ~ 0
D4
Text Label 900  1950 2    50   ~ 0
AREF
Wire Wire Line
	900  1950 1150 1950
$Comp
L Device:C C1
U 1 1 5B60F821
P 1150 2100
F 0 "C1" H 1265 2146 50  0000 L CNN
F 1 "C" H 1265 2055 50  0000 L CNN
F 2 "" H 1188 1950 50  0001 C CNN
F 3 "~" H 1150 2100 50  0001 C CNN
	1    1150 2100
	1    0    0    -1  
$EndComp
Connection ~ 1150 1950
Wire Wire Line
	1150 1950 1400 1950
$Comp
L power:GND #PWR0103
U 1 1 5B60F910
P 1150 2400
F 0 "#PWR0103" H 1150 2150 50  0001 C CNN
F 1 "GND" H 1155 2227 50  0000 C CNN
F 2 "" H 1150 2400 50  0001 C CNN
F 3 "" H 1150 2400 50  0001 C CNN
	1    1150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2400 1150 2250
Text Label 3000 2350 0    50   ~ 0
SCK
Text Label 3000 2450 0    50   ~ 0
MOSI
Text Label 3000 2550 0    50   ~ 0
MISO
Text Label 3000 4050 0    50   ~ 0
SCL
Text Label 3000 4150 0    50   ~ 0
SDA
Text Label 3000 4950 0    50   ~ 0
RX0
Text Label 3000 5050 0    50   ~ 0
TX0
Text Label 3000 5250 0    50   ~ 0
D5
Text Label 3000 5350 0    50   ~ 0
D2
Text Label 3000 5450 0    50   ~ 0
D3
Text Label 3000 5850 0    50   ~ 0
A0
Text Label 3000 5950 0    50   ~ 0
A1
Text Label 3000 6050 0    50   ~ 0
A2
Text Label 3000 6150 0    50   ~ 0
A3
Text Label 3000 6250 0    50   ~ 0
A4
Text Label 3000 6350 0    50   ~ 0
A5
NoConn ~ 3000 1350
NoConn ~ 3000 1450
NoConn ~ 3000 1550
NoConn ~ 3000 1650
NoConn ~ 3000 1750
NoConn ~ 3000 1850
NoConn ~ 3000 1950
NoConn ~ 3000 2050
NoConn ~ 1400 2250
NoConn ~ 1400 2350
NoConn ~ 1400 2450
NoConn ~ 1400 2550
NoConn ~ 1400 2650
NoConn ~ 1400 2750
NoConn ~ 1400 2850
NoConn ~ 1400 2950
NoConn ~ 3000 2950
NoConn ~ 3000 2850
NoConn ~ 3000 2750
NoConn ~ 3000 2650
NoConn ~ 3000 2250
NoConn ~ 1400 3150
NoConn ~ 1400 3250
NoConn ~ 1400 3350
NoConn ~ 1400 3450
NoConn ~ 1400 3550
NoConn ~ 1400 3650
NoConn ~ 1400 3750
NoConn ~ 1400 3850
NoConn ~ 3000 3150
NoConn ~ 3000 3250
NoConn ~ 3000 3350
NoConn ~ 3000 3450
NoConn ~ 3000 3550
NoConn ~ 3000 3650
NoConn ~ 3000 3750
NoConn ~ 3000 3850
NoConn ~ 1400 4050
NoConn ~ 1400 4150
NoConn ~ 1400 4250
NoConn ~ 1400 4350
NoConn ~ 1400 4450
NoConn ~ 1400 4550
NoConn ~ 1400 4650
NoConn ~ 1400 4750
NoConn ~ 3000 4750
NoConn ~ 3000 4650
NoConn ~ 3000 4550
NoConn ~ 3000 4450
NoConn ~ 3000 4350
NoConn ~ 3000 4250
NoConn ~ 1400 4950
NoConn ~ 3000 5150
NoConn ~ 3000 5550
NoConn ~ 3000 5650
NoConn ~ 1400 5450
NoConn ~ 1400 5550
NoConn ~ 1400 5650
NoConn ~ 1400 5850
NoConn ~ 1400 5950
NoConn ~ 1400 6050
NoConn ~ 1400 6150
NoConn ~ 1400 6250
NoConn ~ 3000 6450
NoConn ~ 3000 6550
$EndSCHEMATC
