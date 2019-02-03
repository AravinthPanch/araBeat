EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBeat : MCU Module"
Date "2019-02-03"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 "www.arabeat.aravinth.info"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5C563E80
P 8950 2350
F 0 "A1" H 8950 3750 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 8950 800 50  0000 C CNN
F 2 "Module:Arduino_Nano_WithMountingHoles" H 9100 1400 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8950 1350 50  0001 C CNN
	1    8950 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Counter_Clockwise J1
U 1 1 5C5648F4
P 8950 5300
F 0 "J1" H 9000 6250 50  0000 C CNN
F 1 "02x15_Horinzontal_Header" H 9000 4300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x15_P2.54mm_Horizontal" H 8950 5300 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/445/6130xx21121-537827.pdf" H 8950 5300 50  0001 C CNN
	1    8950 5300
	1    0    0    -1  
$EndComp
Text GLabel 8350 1750 0    50   Input ~ 0
D0
Wire Wire Line
	8350 1750 8450 1750
Text GLabel 8350 1850 0    50   Input ~ 0
D1
Text GLabel 8350 1950 0    50   Input ~ 0
D2
Text GLabel 8350 2050 0    50   Input ~ 0
D3
Text GLabel 8350 2150 0    50   Input ~ 0
D4
Text GLabel 8350 2250 0    50   Input ~ 0
D5
Text GLabel 8350 2350 0    50   Input ~ 0
D6
Text GLabel 8350 2450 0    50   Input ~ 0
D7
Text GLabel 8350 2550 0    50   Input ~ 0
D8
Text GLabel 8350 2650 0    50   Input ~ 0
D9
Text GLabel 8350 2750 0    50   Input ~ 0
D10
Text GLabel 8350 2850 0    50   Input ~ 0
D11
Text GLabel 8350 2950 0    50   Input ~ 0
D12
Text GLabel 8350 3050 0    50   Input ~ 0
D13
Wire Wire Line
	8350 1850 8450 1850
Wire Wire Line
	8450 1950 8350 1950
Wire Wire Line
	8450 2050 8350 2050
Wire Wire Line
	8450 2150 8350 2150
Wire Wire Line
	8450 2250 8350 2250
Wire Wire Line
	8450 2350 8350 2350
Wire Wire Line
	8350 2450 8450 2450
Wire Wire Line
	8450 2550 8350 2550
Wire Wire Line
	8350 2650 8450 2650
Wire Wire Line
	8350 2750 8450 2750
Wire Wire Line
	8350 2850 8450 2850
Wire Wire Line
	8350 2950 8450 2950
Wire Wire Line
	8450 3050 8350 3050
Text GLabel 9600 2350 2    50   Input ~ 0
A0
Text GLabel 9600 2450 2    50   Input ~ 0
A1
Text GLabel 9600 2550 2    50   Input ~ 0
A2
Text GLabel 9600 2650 2    50   Input ~ 0
A3
Text GLabel 9600 2750 2    50   Input ~ 0
A4
Text GLabel 9600 2850 2    50   Input ~ 0
A5
Text GLabel 9600 2950 2    50   Input ~ 0
A6
Text GLabel 9600 3050 2    50   Input ~ 0
A7
Wire Wire Line
	9450 2350 9600 2350
Wire Wire Line
	9600 2450 9450 2450
Wire Wire Line
	9450 2550 9600 2550
Wire Wire Line
	9600 2650 9450 2650
Wire Wire Line
	9600 2750 9450 2750
Wire Wire Line
	9600 2850 9450 2850
Wire Wire Line
	9600 2950 9450 2950
Wire Wire Line
	9600 3050 9450 3050
Text GLabel 8950 3500 3    50   Input ~ 0
GND
Wire Wire Line
	8950 3500 8950 3450
Wire Wire Line
	9050 3350 9050 3450
Wire Wire Line
	9050 3450 8950 3450
Connection ~ 8950 3450
Wire Wire Line
	8950 3450 8950 3350
Text GLabel 9600 2150 2    50   Input ~ 0
AREF
Text GLabel 9600 1750 2    50   Input ~ 0
RST
Text GLabel 9150 1250 1    50   Input ~ 0
5V
Text GLabel 9050 1250 1    50   Input ~ 0
3V3
Text GLabel 8850 1250 1    50   Input ~ 0
VIN
Wire Wire Line
	8850 1250 8850 1300
Wire Wire Line
	9050 1350 9050 1250
Wire Wire Line
	9150 1250 9150 1350
Wire Wire Line
	9450 1750 9500 1750
Wire Wire Line
	9450 1850 9500 1850
Wire Wire Line
	9500 1850 9500 1750
Connection ~ 9500 1750
Wire Wire Line
	9500 1750 9600 1750
Wire Wire Line
	9600 2150 9450 2150
Text GLabel 8600 4600 0    50   Input ~ 0
D1
Text GLabel 8600 4700 0    50   Input ~ 0
D0
Text GLabel 8600 4800 0    50   Input ~ 0
RST
Text GLabel 8600 4900 0    50   Input ~ 0
GND
Text GLabel 8600 5000 0    50   Input ~ 0
D2
Text GLabel 8600 5100 0    50   Input ~ 0
D3
Text GLabel 8600 5200 0    50   Input ~ 0
D4
Text GLabel 8600 5300 0    50   Input ~ 0
D5
Text GLabel 8600 5400 0    50   Input ~ 0
D6
Text GLabel 8600 5500 0    50   Input ~ 0
D7
Text GLabel 8600 5600 0    50   Input ~ 0
D8
Text GLabel 8600 5700 0    50   Input ~ 0
D9
Text GLabel 8600 5800 0    50   Input ~ 0
D10
Text GLabel 8600 5900 0    50   Input ~ 0
D11
Text GLabel 8600 6000 0    50   Input ~ 0
D12
Text GLabel 9400 4600 2    50   Input ~ 0
VIN
Text GLabel 9400 4700 2    50   Input ~ 0
GND
Text GLabel 9400 4800 2    50   Input ~ 0
RST
Text GLabel 9400 4900 2    50   Input ~ 0
5V
Text GLabel 9400 5000 2    50   Input ~ 0
A7
Text GLabel 9400 5100 2    50   Input ~ 0
A6
Text GLabel 9400 5200 2    50   Input ~ 0
A5
Text GLabel 9400 5300 2    50   Input ~ 0
A4
Text GLabel 9400 5400 2    50   Input ~ 0
A3
Text GLabel 9400 5600 2    50   Input ~ 0
A1
Text GLabel 9400 5700 2    50   Input ~ 0
A0
Text GLabel 9400 5500 2    50   Input ~ 0
A2
Text GLabel 9400 5800 2    50   Input ~ 0
AREF
Text GLabel 9400 5900 2    50   Input ~ 0
3V3
Text GLabel 9400 6000 2    50   Input ~ 0
D13
Wire Wire Line
	9250 4600 9400 4600
Wire Wire Line
	9400 4700 9250 4700
Wire Wire Line
	9400 4800 9250 4800
Wire Wire Line
	9400 4900 9250 4900
Wire Wire Line
	9400 5000 9250 5000
Wire Wire Line
	9400 5100 9250 5100
Wire Wire Line
	9400 5200 9250 5200
Wire Wire Line
	9400 5300 9250 5300
Wire Wire Line
	9400 5400 9250 5400
Wire Wire Line
	9400 5500 9250 5500
Wire Wire Line
	9400 5600 9250 5600
Wire Wire Line
	9400 5700 9250 5700
Wire Wire Line
	9400 5800 9250 5800
Wire Wire Line
	9400 5900 9250 5900
Wire Wire Line
	9400 6000 9250 6000
Wire Wire Line
	8750 6000 8600 6000
Wire Wire Line
	8750 5900 8600 5900
Wire Wire Line
	8600 5800 8750 5800
Wire Wire Line
	8600 5700 8750 5700
Wire Wire Line
	8600 5600 8750 5600
Wire Wire Line
	8600 5500 8750 5500
Wire Wire Line
	8600 5400 8750 5400
Wire Wire Line
	8600 5300 8750 5300
Wire Wire Line
	8600 5200 8750 5200
Wire Wire Line
	8600 5100 8750 5100
Wire Wire Line
	8600 5000 8750 5000
Wire Wire Line
	8600 4900 8750 4900
Wire Wire Line
	8600 4800 8750 4800
Wire Wire Line
	8600 4700 8750 4700
Wire Wire Line
	8600 4600 8750 4600
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C5897B1
P 8450 1200
F 0 "#FLG0101" H 8450 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 8450 1374 50  0000 C CNN
F 2 "" H 8450 1200 50  0001 C CNN
F 3 "~" H 8450 1200 50  0001 C CNN
	1    8450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1200 8450 1300
Wire Wire Line
	8450 1300 8850 1300
Connection ~ 8850 1300
Wire Wire Line
	8850 1300 8850 1350
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C58B65E
P 8600 3500
F 0 "#FLG0102" H 8600 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 8600 3673 50  0000 C CNN
F 2 "" H 8600 3500 50  0001 C CNN
F 3 "~" H 8600 3500 50  0001 C CNN
	1    8600 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 3500 8600 3450
Wire Wire Line
	8600 3450 8950 3450
$EndSCHEMATC
