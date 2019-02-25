EESchema Schematic File Version 4
LIBS:mcu-cassette-cache
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
L ARABEAT:Arduino_Nano_v3.x A1
U 1 1 5C563E80
P 6900 4700
F 0 "A1" H 6900 6100 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 6900 3250 50  0000 C CNN
F 2 "Module:Arduino_Nano_WithMountingHoles" H 7050 3750 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6900 3700 50  0001 C CNN
	1    6900 4700
	1    0    0    -1  
$EndComp
Text GLabel 6300 4100 0    50   Input ~ 0
D0
Wire Wire Line
	6300 4100 6400 4100
Text GLabel 6300 4200 0    50   Input ~ 0
D1
Text GLabel 6300 4300 0    50   Input ~ 0
D2
Text GLabel 6300 4400 0    50   Input ~ 0
D3
Text GLabel 6300 4500 0    50   Input ~ 0
D4
Text GLabel 6300 4600 0    50   Input ~ 0
D5
Text GLabel 6300 4700 0    50   Input ~ 0
D6
Text GLabel 6300 4800 0    50   Input ~ 0
D7
Text GLabel 6300 4900 0    50   Input ~ 0
D8
Text GLabel 6300 5000 0    50   Input ~ 0
D9
Text GLabel 6300 5100 0    50   Input ~ 0
D10
Text GLabel 6300 5200 0    50   Input ~ 0
D11
Text GLabel 6300 5300 0    50   Input ~ 0
D12
Text GLabel 6300 5400 0    50   Input ~ 0
D13
Wire Wire Line
	6300 4200 6400 4200
Wire Wire Line
	6400 4300 6300 4300
Wire Wire Line
	6400 4400 6300 4400
Wire Wire Line
	6400 4500 6300 4500
Wire Wire Line
	6400 4600 6300 4600
Wire Wire Line
	6400 4700 6300 4700
Wire Wire Line
	6300 4800 6400 4800
Wire Wire Line
	6400 4900 6300 4900
Wire Wire Line
	6300 5000 6400 5000
Wire Wire Line
	6300 5100 6400 5100
Wire Wire Line
	6300 5200 6400 5200
Wire Wire Line
	6300 5300 6400 5300
Wire Wire Line
	6400 5400 6300 5400
Text GLabel 7550 4700 2    50   Input ~ 0
A0
Text GLabel 7550 4800 2    50   Input ~ 0
A1
Text GLabel 7550 4900 2    50   Input ~ 0
A2
Text GLabel 7550 5000 2    50   Input ~ 0
A3
Text GLabel 7550 5100 2    50   Input ~ 0
A4
Text GLabel 7550 5200 2    50   Input ~ 0
A5
Text GLabel 7550 5300 2    50   Input ~ 0
A6
Text GLabel 7550 5400 2    50   Input ~ 0
A7
Wire Wire Line
	7400 4700 7550 4700
Wire Wire Line
	7550 4800 7400 4800
Wire Wire Line
	7400 4900 7550 4900
Wire Wire Line
	7550 5000 7400 5000
Wire Wire Line
	7550 5100 7400 5100
Wire Wire Line
	7550 5200 7400 5200
Wire Wire Line
	7550 5300 7400 5300
Wire Wire Line
	7550 5400 7400 5400
Text GLabel 6900 5850 3    50   Input ~ 0
GND
Wire Wire Line
	6900 5850 6900 5800
Wire Wire Line
	7000 5700 7000 5800
Wire Wire Line
	7000 5800 6900 5800
Connection ~ 6900 5800
Wire Wire Line
	6900 5800 6900 5700
Text GLabel 7550 4500 2    50   Input ~ 0
AREF
Text GLabel 7550 4100 2    50   Input ~ 0
RST
Text GLabel 7100 3600 1    50   Input ~ 0
5V
Wire Wire Line
	7100 3600 7100 3700
Wire Wire Line
	7400 4100 7450 4100
Wire Wire Line
	7400 4200 7450 4200
Wire Wire Line
	7450 4200 7450 4100
Connection ~ 7450 4100
Wire Wire Line
	7450 4100 7550 4100
Wire Wire Line
	7550 4500 7400 4500
Text GLabel 8850 4450 0    50   Input ~ 0
D1
Text GLabel 8850 4350 0    50   Input ~ 0
D0
Text GLabel 8850 4550 0    50   Input ~ 0
D2
Text GLabel 8850 4650 0    50   Input ~ 0
D3
Text GLabel 8850 4750 0    50   Input ~ 0
D4
Text GLabel 8850 4850 0    50   Input ~ 0
D5
Text GLabel 8850 4950 0    50   Input ~ 0
D6
Text GLabel 8850 5050 0    50   Input ~ 0
D7
Text GLabel 8850 5150 0    50   Input ~ 0
D8
Text GLabel 8850 5250 0    50   Input ~ 0
D9
Text GLabel 8850 5350 0    50   Input ~ 0
D10
Text GLabel 8850 5450 0    50   Input ~ 0
D11
Text GLabel 8850 5550 0    50   Input ~ 0
D12
Text GLabel 10200 4250 2    50   Input ~ 0
GND
Text GLabel 10200 4750 2    50   Input ~ 0
RST
Text GLabel 8850 4250 0    50   Input ~ 0
5V
Text GLabel 10200 4950 2    50   Input ~ 0
A7
Text GLabel 10200 5050 2    50   Input ~ 0
A6
Text GLabel 10200 5150 2    50   Input ~ 0
A5
Text GLabel 10200 5250 2    50   Input ~ 0
A4
Text GLabel 10200 5350 2    50   Input ~ 0
A3
Text GLabel 10200 5550 2    50   Input ~ 0
A1
Text GLabel 10200 5650 2    50   Input ~ 0
A0
Text GLabel 10200 5450 2    50   Input ~ 0
A2
Text GLabel 10200 4850 2    50   Input ~ 0
AREF
Text GLabel 8850 5650 0    50   Input ~ 0
D13
$Comp
L ARABEAT:02x15_PIN_HEADER_SOCKET U1
U 1 1 5C649CA8
P 9550 5050
F 0 "U1" H 9525 6115 50  0000 C CNN
F 1 "02x15_PIN_HEADER_SOCKET" H 9525 6024 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x15_P2.54mm_Horizontal" H 9400 5250 50  0001 C CNN
F 3 "" H 9400 5250 50  0001 C CNN
	1    9550 5050
	1    0    0    -1  
$EndComp
NoConn ~ 10200 4350
NoConn ~ 10200 4450
NoConn ~ 10200 4550
NoConn ~ 6800 3700
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C6473B3
P 10750 3850
F 0 "#FLG02" H 10750 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 10750 4024 50  0000 C CNN
F 2 "" H 10750 3850 50  0001 C CNN
F 3 "~" H 10750 3850 50  0001 C CNN
	1    10750 3850
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C647C99
P 8350 3850
F 0 "#FLG01" H 8350 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 8350 4024 50  0000 C CNN
F 2 "" H 8350 3850 50  0001 C CNN
F 3 "~" H 8350 3850 50  0001 C CNN
	1    8350 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 3850 8850 3850
Wire Wire Line
	8850 3850 8850 4250
Wire Wire Line
	10750 3850 10200 3850
Wire Wire Line
	10200 3850 10200 4250
$Comp
L Device:LED D1
U 1 1 5C648856
P 4050 4750
F 0 "D1" V 4088 4633 50  0000 R CNN
F 1 "RED_HEART_LED" V 3997 4633 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 4050 4750 50  0001 C CNN
F 3 "~" H 4050 4750 50  0001 C CNN
	1    4050 4750
	0    -1   -1   0   
$EndComp
Text GLabel 4050 4450 1    50   Input ~ 0
D5
Wire Wire Line
	4050 4450 4050 4600
Text GLabel 4050 5250 3    50   Input ~ 0
GND
Wire Wire Line
	4050 5050 4050 4900
$Comp
L Device:LED D2
U 1 1 5C64B3B3
P 4950 4750
F 0 "D2" V 4988 4633 50  0000 R CNN
F 1 "GREEN_PWR_LED" V 4897 4633 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 4750 50  0001 C CNN
F 3 "~" H 4950 4750 50  0001 C CNN
	1    4950 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 4450 4950 4600
Text GLabel 4950 5250 3    50   Input ~ 0
GND
Wire Wire Line
	4950 5050 4950 4900
Text GLabel 4950 4450 1    50   Input ~ 0
5V
$Comp
L Device:R_Small R1
U 1 1 5C64D1DB
P 4050 5150
F 0 "R1" H 4109 5196 50  0000 L CNN
F 1 "1K" H 4109 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 5150 50  0001 C CNN
F 3 "~" H 4050 5150 50  0001 C CNN
	1    4050 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5C64D476
P 4950 5150
F 0 "R2" H 5009 5196 50  0000 L CNN
F 1 "1K" H 5009 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 5150 50  0001 C CNN
F 3 "~" H 4950 5150 50  0001 C CNN
	1    4950 5150
	1    0    0    -1  
$EndComp
Text GLabel 10200 4650 2    50   Input ~ 0
3V3
Text GLabel 7000 3600 1    50   Input ~ 0
3V3
Wire Wire Line
	7000 3600 7000 3700
$Comp
L Connector:TestPoint TP2
U 1 1 5C733DE2
P 3600 5300
F 0 "TP2" H 3542 5327 50  0000 R CNN
F 1 "5V" H 3542 5418 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3800 5300 50  0001 C CNN
F 3 "~" H 3800 5300 50  0001 C CNN
	1    3600 5300
	-1   0    0    1   
$EndComp
Text GLabel 3600 4450 1    50   Input ~ 0
5V
Wire Wire Line
	3600 4450 3600 5300
$Comp
L Connector:TestPoint TP1
U 1 1 5C7350AC
P 3200 5300
F 0 "TP1" H 3142 5327 50  0000 R CNN
F 1 "GND" H 3142 5418 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3400 5300 50  0001 C CNN
F 3 "~" H 3400 5300 50  0001 C CNN
	1    3200 5300
	-1   0    0    1   
$EndComp
Text GLabel 3200 4450 1    50   Input ~ 0
GND
Wire Wire Line
	3200 4450 3200 5300
$EndSCHEMATC
