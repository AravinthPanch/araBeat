EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBeat : Proto Module v0.1"
Date "2019-02-25"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 "www.arabeat.aravinth.info"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
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
Text GLabel 7050 5650 0    50   Input ~ 0
RST
Text GLabel 8850 4250 0    50   Input ~ 0
5V
Text GLabel 7050 5450 0    50   Input ~ 0
A7
Text GLabel 7050 5350 0    50   Input ~ 0
A6
Text GLabel 7050 5250 0    50   Input ~ 0
A5
Text GLabel 7050 5150 0    50   Input ~ 0
A4
Text GLabel 7050 5050 0    50   Input ~ 0
A3
Text GLabel 7050 4850 0    50   Input ~ 0
A1
Text GLabel 7050 4750 0    50   Input ~ 0
A0
Text GLabel 7050 4950 0    50   Input ~ 0
A2
Text GLabel 7050 5550 0    50   Input ~ 0
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
Text GLabel 7050 5750 0    50   Input ~ 0
3V3
$Comp
L Connector_Generic:Conn_01x30 J1
U 1 1 5C73C396
P 7250 4650
F 0 "J1" H 7330 4642 50  0000 L CNN
F 1 "Conn_01x30" H 7330 4551 50  0000 L CNN
F 2 "ARABEAT:PERF-PADS" H 7250 4650 50  0001 C CNN
F 3 "~" H 7250 4650 50  0001 C CNN
	1    7250 4650
	1    0    0    -1  
$EndComp
Text GLabel 7050 3250 0    50   Input ~ 0
5V
Text GLabel 7050 3450 0    50   Input ~ 0
D1
Text GLabel 7050 3350 0    50   Input ~ 0
D0
Text GLabel 7050 3550 0    50   Input ~ 0
D2
Text GLabel 7050 3650 0    50   Input ~ 0
D3
Text GLabel 7050 3750 0    50   Input ~ 0
D4
Text GLabel 7050 3850 0    50   Input ~ 0
D5
Text GLabel 7050 3950 0    50   Input ~ 0
D6
Text GLabel 7050 4050 0    50   Input ~ 0
D7
Text GLabel 7050 4150 0    50   Input ~ 0
D8
Text GLabel 7050 4250 0    50   Input ~ 0
D9
Text GLabel 7050 4350 0    50   Input ~ 0
D10
Text GLabel 7050 4450 0    50   Input ~ 0
D11
Text GLabel 7050 4550 0    50   Input ~ 0
D12
Text GLabel 7050 4650 0    50   Input ~ 0
D13
Text GLabel 7050 6150 0    50   Input ~ 0
GND
Text GLabel 7050 5850 0    50   Input ~ 0
3V3
Text GLabel 7050 6050 0    50   Input ~ 0
GND
Text GLabel 7050 5950 0    50   Input ~ 0
5V
Text GLabel 10200 4750 2    50   Input ~ 0
RST
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
Text GLabel 10200 4650 2    50   Input ~ 0
3V3
$EndSCHEMATC
