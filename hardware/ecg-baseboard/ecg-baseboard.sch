EESchema Schematic File Version 4
LIBS:ecg-baseboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ECG Baseboard : araBeat"
Date "2018-10-30"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5BD88A95
P 8700 4400
F 0 "A1" H 8650 5750 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 8650 5600 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 8850 3450 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8700 3400 50  0001 C CNN
	1    8700 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J1
U 1 1 5BD88FD2
P 10050 4500
F 0 "J1" V 10750 4500 50  0000 C CNN
F 1 "Protocentral MAX30003" V 10600 4500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 10050 4500 50  0001 C CNN
F 3 "~" H 10050 4500 50  0001 C CNN
	1    10050 4500
	1    0    0    -1  
$EndComp
Text Label 10150 5000 0    50   ~ 0
MISO
Text Label 10150 4900 0    50   ~ 0
MOSI
Text Label 10150 4800 0    50   ~ 0
SCLK
Text Label 10150 4700 0    50   ~ 0
CSB
Text Label 10150 4200 0    50   ~ 0
VCC
Text Label 10150 4100 0    50   ~ 0
GND
Text Label 10150 4300 0    50   ~ 0
GND
Text Label 10150 4600 0    50   ~ 0
FCLK
Text Label 10150 4500 0    50   ~ 0
INT1
Text Label 10150 4400 0    50   ~ 0
INT2
Text Label 8550 5000 0    50   ~ 0
MISO
Text Label 8550 4900 0    50   ~ 0
MOSI
Text Label 8550 5100 0    50   ~ 0
SCK
Text Label 8550 4500 0    50   ~ 0
CSB
Wire Wire Line
	9850 4200 9450 4200
Wire Wire Line
	9450 3350 8900 3350
Wire Wire Line
	8900 3350 8900 3400
Wire Wire Line
	9850 4300 9700 4300
Wire Wire Line
	9450 4300 9450 5550
Wire Wire Line
	9850 4700 9500 4700
Wire Wire Line
	9500 4700 9500 5600
Wire Wire Line
	9500 5600 7950 5600
Wire Wire Line
	7950 5600 7950 4500
Wire Wire Line
	7950 4500 8200 4500
Wire Wire Line
	9850 4800 9550 4800
Wire Wire Line
	9550 4800 9550 5650
Wire Wire Line
	9550 5650 8150 5650
Wire Wire Line
	8150 5650 8150 5100
Wire Wire Line
	8150 5100 8200 5100
Wire Wire Line
	9850 4900 9600 4900
Wire Wire Line
	9600 4900 9600 5700
Wire Wire Line
	9600 5700 8050 5700
Wire Wire Line
	8050 5700 8050 4900
Wire Wire Line
	8050 4900 8200 4900
Wire Wire Line
	8200 5000 8100 5000
Wire Wire Line
	8100 5000 8100 5750
Wire Wire Line
	8100 5750 9650 5750
Wire Wire Line
	9650 5750 9650 5000
Wire Wire Line
	9650 5000 9850 5000
Wire Wire Line
	9850 4100 9700 4100
Wire Wire Line
	9700 4100 9700 4300
Connection ~ 9700 4300
Wire Wire Line
	9700 4300 9450 4300
Wire Wire Line
	8700 5400 8700 5550
NoConn ~ 8200 3800
NoConn ~ 8200 3900
NoConn ~ 8200 4000
NoConn ~ 8200 4100
NoConn ~ 8200 4200
NoConn ~ 8200 4300
NoConn ~ 8200 4400
NoConn ~ 8200 4600
NoConn ~ 8200 4700
NoConn ~ 8200 4800
NoConn ~ 8600 3400
NoConn ~ 8800 3400
NoConn ~ 9200 3800
NoConn ~ 9200 3900
NoConn ~ 9200 4200
NoConn ~ 9200 4400
NoConn ~ 9200 4500
NoConn ~ 9200 4600
NoConn ~ 9200 4700
NoConn ~ 9200 4800
NoConn ~ 9200 4900
NoConn ~ 9200 5000
NoConn ~ 9200 5100
NoConn ~ 9850 4400
NoConn ~ 9850 4500
NoConn ~ 9850 4600
$Comp
L power:GND #PWR0101
U 1 1 5BE5643F
P 8800 5800
F 0 "#PWR0101" H 8800 5550 50  0001 C CNN
F 1 "GND" H 8805 5627 50  0000 C CNN
F 2 "" H 8800 5800 50  0001 C CNN
F 3 "" H 8800 5800 50  0001 C CNN
	1    8800 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5550 8800 5550
Wire Wire Line
	8800 5800 8800 5550
Connection ~ 8800 5550
Wire Wire Line
	8800 5550 9450 5550
Wire Wire Line
	8800 5550 8800 5400
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5BE57418
P 8450 5800
F 0 "#FLG0101" H 8450 5875 50  0001 C CNN
F 1 "PWR_FLAG" H 8450 5973 50  0000 C CNN
F 2 "" H 8450 5800 50  0001 C CNN
F 3 "~" H 8450 5800 50  0001 C CNN
	1    8450 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 5800 8800 5800
Connection ~ 8800 5800
Wire Wire Line
	9450 3350 9450 4200
$EndSCHEMATC
