EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBeat : ECG Cassette"
Date "2019-01-31"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PROTOCENTRAL:MAX30003 U1
U 1 1 5C532DDD
P 9800 3600
F 0 "U1" H 9700 4250 50  0000 L CNN
F 1 "MAX30003" H 9550 3000 50  0000 L CNN
F 2 "PROTOCENTRAL:MAX30003" H 9800 3600 50  0001 C CNN
F 3 "https://github.com/Protocentral/protocentral_max30003" H 11100 4150 50  0001 C CNN
	1    9800 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x07_Counter_Clockwise J2
U 1 1 5C533530
P 8850 4900
F 0 "J2" H 8900 5417 50  0000 C CNN
F 1 "02x07_Horizontal_Pin_Header" H 8950 4450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Horizontal" H 8850 4900 50  0001 C CNN
F 3 "~" H 8850 4900 50  0001 C CNN
	1    8850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3200 9100 3200
Wire Wire Line
	9450 3400 8500 3400
Wire Wire Line
	9450 3600 8400 3600
Wire Wire Line
	9450 3800 9300 3800
Wire Wire Line
	9450 4000 9200 4000
Wire Wire Line
	8650 4600 8650 3100
Wire Wire Line
	8650 4700 8600 4700
Wire Wire Line
	8600 4700 8600 3200
Wire Wire Line
	8650 4800 8550 4800
Wire Wire Line
	8550 4800 8550 3300
Wire Wire Line
	8650 4900 8500 4900
Wire Wire Line
	8500 4900 8500 3400
Wire Wire Line
	8650 5000 8450 5000
Wire Wire Line
	8450 5000 8450 3500
Wire Wire Line
	8450 3500 9450 3500
Wire Wire Line
	8650 5100 8400 5100
Wire Wire Line
	8400 5100 8400 3600
Wire Wire Line
	9450 3700 8350 3700
Wire Wire Line
	8650 5200 8350 5200
Wire Wire Line
	8350 5200 8350 3700
Wire Wire Line
	9150 5000 9200 5000
Wire Wire Line
	9200 5000 9200 4000
Wire Wire Line
	9150 5100 9250 5100
Wire Wire Line
	9250 5100 9250 3900
Wire Wire Line
	9250 3900 9450 3900
Wire Wire Line
	9150 5200 9300 5200
Wire Wire Line
	9300 5200 9300 3800
NoConn ~ 9150 4600
NoConn ~ 9150 4700
NoConn ~ 9150 4800
NoConn ~ 9150 4900
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C53E774
P 9100 2700
F 0 "#FLG0101" H 9100 2775 50  0001 C CNN
F 1 "PWR_FLAG" H 9100 2874 50  0000 C CNN
F 2 "" H 9100 2700 50  0001 C CNN
F 3 "~" H 9100 2700 50  0001 C CNN
	1    9100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2700 9100 2950
Connection ~ 9100 3200
Wire Wire Line
	9100 3200 8600 3200
Wire Wire Line
	8650 3100 9300 3100
Wire Wire Line
	8550 3300 9250 3300
Wire Wire Line
	9100 2950 9300 2950
Wire Wire Line
	9300 2950 9300 3100
Connection ~ 9100 2950
Wire Wire Line
	9100 2950 9100 3050
Connection ~ 9300 3100
Wire Wire Line
	9300 3100 9450 3100
Wire Wire Line
	9100 3050 9250 3050
Wire Wire Line
	9250 3050 9250 3300
Connection ~ 9100 3050
Wire Wire Line
	9100 3050 9100 3200
Connection ~ 9250 3300
Wire Wire Line
	9250 3300 9450 3300
$EndSCHEMATC
