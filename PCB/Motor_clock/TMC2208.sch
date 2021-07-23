EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TMC_driver:driver U3
U 1 1 60DC8843
P 3800 2750
AR Path="/60DC8843" Ref="U3"  Part="1" 
AR Path="/60D8D789/60DC8843" Ref="U3"  Part="1" 
F 0 "U3" H 3900 2925 50  0000 C CNN
F 1 "M_H_1" H 3900 2834 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 3800 2750 50  0001 C CNN
F 3 "" H 3800 2750 50  0001 C CNN
	1    3800 2750
	1    0    0    -1  
$EndComp
Text GLabel 3600 3400 0    50   Input ~ 0
P0
$Comp
L TMC_driver:driver U5
U 1 1 60DC9563
P 4975 2775
AR Path="/60DC9563" Ref="U5"  Part="1" 
AR Path="/60D8D789/60DC9563" Ref="U5"  Part="1" 
F 0 "U5" H 5075 2950 50  0000 C CNN
F 1 "M_H_2" H 5075 2859 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 4975 2775 50  0001 C CNN
F 3 "" H 4975 2775 50  0001 C CNN
	1    4975 2775
	1    0    0    -1  
$EndComp
Text GLabel 4775 3425 0    50   Input ~ 0
P1
$Comp
L TMC_driver:driver U4
U 1 1 60DCCBD7
P 3825 4225
AR Path="/60DCCBD7" Ref="U4"  Part="1" 
AR Path="/60D8D789/60DCCBD7" Ref="U4"  Part="1" 
F 0 "U4" H 3925 4400 50  0000 C CNN
F 1 "M_S_1" H 3925 4309 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 3825 4225 50  0001 C CNN
F 3 "" H 3825 4225 50  0001 C CNN
	1    3825 4225
	1    0    0    -1  
$EndComp
Text GLabel 6025 3425 0    50   Input ~ 0
P2
$Comp
L TMC_driver:driver U6
U 1 1 60DCD8A3
P 5000 4225
AR Path="/60DCD8A3" Ref="U6"  Part="1" 
AR Path="/60D8D789/60DCD8A3" Ref="U6"  Part="1" 
F 0 "U6" H 5100 4400 50  0000 C CNN
F 1 "M_S_2" H 5100 4309 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 5000 4225 50  0001 C CNN
F 3 "" H 5000 4225 50  0001 C CNN
	1    5000 4225
	1    0    0    -1  
$EndComp
Text GLabel 7250 3425 0    50   Input ~ 0
P3
$Comp
L TMC_driver:driver U7
U 1 1 60DD1A27
P 6225 2775
AR Path="/60DD1A27" Ref="U7"  Part="1" 
AR Path="/60D8D789/60DD1A27" Ref="U7"  Part="1" 
F 0 "U7" H 6325 2950 50  0000 C CNN
F 1 "M_M_1" H 6325 2859 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 6225 2775 50  0001 C CNN
F 3 "" H 6225 2775 50  0001 C CNN
	1    6225 2775
	1    0    0    -1  
$EndComp
$Comp
L TMC_driver:driver U8
U 1 1 60DD2B7F
P 7450 2775
AR Path="/60DD2B7F" Ref="U8"  Part="1" 
AR Path="/60D8D789/60DD2B7F" Ref="U8"  Part="1" 
F 0 "U8" H 7550 2950 50  0000 C CNN
F 1 "M_M_2" H 7550 2859 50  0000 C CNN
F 2 "TMC2208:TMC2208" H 7450 2775 50  0001 C CNN
F 3 "" H 7450 2775 50  0001 C CNN
	1    7450 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3500 4200 3675
Wire Wire Line
	4200 3675 5375 3675
Wire Wire Line
	5375 3675 5375 3525
Wire Wire Line
	5375 3675 5725 3675
Wire Wire Line
	6625 3675 6625 3525
Connection ~ 5375 3675
Wire Wire Line
	6625 3675 7850 3675
Wire Wire Line
	7850 3675 7850 3525
Connection ~ 6625 3675
$Comp
L power:GND #PWR0117
U 1 1 60DD8449
P 5725 3675
F 0 "#PWR0117" H 5725 3425 50  0001 C CNN
F 1 "GND" H 5730 3502 50  0000 C CNN
F 2 "" H 5725 3675 50  0001 C CNN
F 3 "" H 5725 3675 50  0001 C CNN
	1    5725 3675
	1    0    0    -1  
$EndComp
Connection ~ 5725 3675
Wire Wire Line
	5725 3675 6625 3675
Wire Wire Line
	4225 4975 4225 5125
Wire Wire Line
	4225 5125 5400 5125
Wire Wire Line
	5400 5125 5400 4975
Wire Wire Line
	5400 5125 5775 5125
Connection ~ 5400 5125
$Comp
L power:GND #PWR0118
U 1 1 60DD9AF9
P 5775 5125
F 0 "#PWR0118" H 5775 4875 50  0001 C CNN
F 1 "GND" H 5780 4952 50  0000 C CNN
F 2 "" H 5775 5125 50  0001 C CNN
F 3 "" H 5775 5125 50  0001 C CNN
	1    5775 5125
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0119
U 1 1 60DDC300
P 4200 3400
F 0 "#PWR0119" H 4200 3250 50  0001 C CNN
F 1 "+5V" V 4215 3528 50  0000 L CNN
F 2 "" H 4200 3400 50  0001 C CNN
F 3 "" H 4200 3400 50  0001 C CNN
	1    4200 3400
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 60DDD0DA
P 5375 3425
F 0 "#PWR0120" H 5375 3275 50  0001 C CNN
F 1 "+5V" V 5390 3553 50  0000 L CNN
F 2 "" H 5375 3425 50  0001 C CNN
F 3 "" H 5375 3425 50  0001 C CNN
	1    5375 3425
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0121
U 1 1 60DDD955
P 6625 3425
F 0 "#PWR0121" H 6625 3275 50  0001 C CNN
F 1 "+5V" V 6640 3553 50  0000 L CNN
F 2 "" H 6625 3425 50  0001 C CNN
F 3 "" H 6625 3425 50  0001 C CNN
	1    6625 3425
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 60DDDF29
P 7850 3425
F 0 "#PWR0122" H 7850 3275 50  0001 C CNN
F 1 "+5V" V 7865 3553 50  0000 L CNN
F 2 "" H 7850 3425 50  0001 C CNN
F 3 "" H 7850 3425 50  0001 C CNN
	1    7850 3425
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 60DDE7B7
P 4225 4875
F 0 "#PWR0123" H 4225 4725 50  0001 C CNN
F 1 "+5V" V 4240 5003 50  0000 L CNN
F 2 "" H 4225 4875 50  0001 C CNN
F 3 "" H 4225 4875 50  0001 C CNN
	1    4225 4875
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 60DDF10A
P 5400 4875
F 0 "#PWR0124" H 5400 4725 50  0001 C CNN
F 1 "+5V" V 5415 5003 50  0000 L CNN
F 2 "" H 5400 4875 50  0001 C CNN
F 3 "" H 5400 4875 50  0001 C CNN
	1    5400 4875
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 2800 3600 2700
Wire Wire Line
	3600 2700 4550 2700
Wire Wire Line
	7250 2700 7250 2825
Wire Wire Line
	4775 2825 4775 2700
Connection ~ 4775 2700
Wire Wire Line
	6025 2825 6025 2700
Wire Wire Line
	4775 2700 5575 2700
Connection ~ 6025 2700
Wire Wire Line
	6025 2700 6900 2700
$Comp
L power:GND #PWR0125
U 1 1 60DEE2F6
P 5700 2700
F 0 "#PWR0125" H 5700 2450 50  0001 C CNN
F 1 "GND" H 5705 2527 50  0000 C CNN
F 2 "" H 5700 2700 50  0001 C CNN
F 3 "" H 5700 2700 50  0001 C CNN
	1    5700 2700
	1    0    0    -1  
$EndComp
Connection ~ 5700 2700
Wire Wire Line
	5700 2700 6025 2700
Wire Wire Line
	3625 4275 3625 4125
Wire Wire Line
	3625 4125 4450 4125
Wire Wire Line
	4800 4275 4800 4125
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 60DF0BD2
P 4400 3100
F 0 "J5" H 4428 3076 50  0000 L CNN
F 1 "M_H_1" H 4428 2985 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 4400 3100 50  0001 C CNN
F 3 "~" H 4400 3100 50  0001 C CNN
	1    4400 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J7
U 1 1 60DF4009
P 5575 3125
F 0 "J7" H 5603 3101 50  0000 L CNN
F 1 "M_H_1" H 5603 3010 50  0000 L CIN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 5575 3125 50  0001 C CNN
F 3 "~" H 5575 3125 50  0001 C CNN
	1    5575 3125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J9
U 1 1 60DF5282
P 6825 3125
F 0 "J9" H 6853 3101 50  0000 L CNN
F 1 "M_M_1" H 6853 3010 50  0000 L CIN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 6825 3125 50  0001 C CNN
F 3 "~" H 6825 3125 50  0001 C CNN
	1    6825 3125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J10
U 1 1 60DF637E
P 8050 3125
F 0 "J10" H 8078 3101 50  0000 L CNN
F 1 "M_M_2" H 8078 3010 50  0000 L CIN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 8050 3125 50  0001 C CNN
F 3 "~" H 8050 3125 50  0001 C CNN
	1    8050 3125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J6
U 1 1 60DF7582
P 4425 4575
F 0 "J6" H 4453 4551 50  0000 L CNN
F 1 "M_S_1" H 4453 4460 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 4425 4575 50  0001 C CNN
F 3 "~" H 4425 4575 50  0001 C CNN
	1    4425 4575
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J8
U 1 1 60DF90D4
P 5600 4575
F 0 "J8" H 5628 4551 50  0000 L CNN
F 1 "M_S_2" H 5628 4460 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 5600 4575 50  0001 C CNN
F 3 "~" H 5600 4575 50  0001 C CNN
	1    5600 4575
	1    0    0    -1  
$EndComp
NoConn ~ 3600 3200
NoConn ~ 4775 3225
NoConn ~ 6025 3225
NoConn ~ 7250 3225
NoConn ~ 3625 4675
NoConn ~ 4800 4675
$Comp
L power:GND #PWR0126
U 1 1 60EABB17
P 4550 4175
F 0 "#PWR0126" H 4550 3925 50  0001 C CNN
F 1 "GND" H 4555 4002 50  0000 C CNN
F 2 "" H 4550 4175 50  0001 C CNN
F 3 "" H 4550 4175 50  0001 C CNN
	1    4550 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4175 4550 4125
Connection ~ 4550 4125
Wire Wire Line
	4550 4125 4800 4125
Text GLabel 3600 3500 0    50   Input ~ 0
DIR
Text GLabel 4775 3525 0    50   Input ~ 0
DIR
Text GLabel 6025 3525 0    50   Input ~ 0
DIR
Text GLabel 7250 3525 0    50   Input ~ 0
DIR
Text GLabel 3625 4975 0    50   Input ~ 0
DIR
Text GLabel 4800 4975 0    50   Input ~ 0
DIR
Wire Wire Line
	3600 3000 3600 2900
Connection ~ 3600 2800
Connection ~ 3600 2900
Wire Wire Line
	3600 2900 3600 2800
Wire Wire Line
	4775 3025 4775 2925
Connection ~ 4775 2825
Connection ~ 4775 2925
Wire Wire Line
	4775 2925 4775 2825
Wire Wire Line
	6025 3025 6025 2925
Connection ~ 6025 2825
Connection ~ 6025 2925
Wire Wire Line
	6025 2925 6025 2825
Wire Wire Line
	7250 3025 7250 2925
Connection ~ 7250 2825
Connection ~ 7250 2925
Wire Wire Line
	7250 2925 7250 2825
Text GLabel 3600 3100 0    50   Input ~ 0
PDN
Text GLabel 4775 3125 0    50   Input ~ 0
PDN
Text GLabel 6025 3125 0    50   Input ~ 0
PDN
Text GLabel 7250 3125 0    50   Input ~ 0
PDN
Text GLabel 7250 3125 0    50   Input ~ 0
PDN
Text GLabel 3625 4575 0    50   Input ~ 0
PDN
Text GLabel 4800 4575 0    50   Input ~ 0
PDN
Text GLabel 4200 2800 2    50   Input ~ 0
VM
Text GLabel 5375 2825 2    50   Input ~ 0
VM
Text GLabel 6625 2825 2    50   Input ~ 0
VM
Text GLabel 7850 2825 2    50   Input ~ 0
VM
Text GLabel 4225 4275 2    50   Input ~ 0
VM
Text GLabel 5400 4275 2    50   Input ~ 0
VM
Wire Wire Line
	4200 2900 4550 2900
Wire Wire Line
	4550 2900 4550 2700
Connection ~ 4550 2700
Wire Wire Line
	4550 2700 4775 2700
Wire Wire Line
	5375 2925 5575 2925
Wire Wire Line
	5575 2925 5575 2700
Connection ~ 5575 2700
Wire Wire Line
	5575 2700 5700 2700
Wire Wire Line
	6625 2925 6900 2925
Wire Wire Line
	6900 2925 6900 2700
Connection ~ 6900 2700
Wire Wire Line
	6900 2700 7250 2700
Wire Wire Line
	7250 2700 8075 2700
Wire Wire Line
	8075 2700 8075 2925
Wire Wire Line
	8075 2925 7850 2925
Connection ~ 7250 2700
Wire Wire Line
	4225 4375 4450 4375
Wire Wire Line
	4450 4375 4450 4125
Connection ~ 4450 4125
Wire Wire Line
	4450 4125 4550 4125
Wire Wire Line
	4800 4125 5700 4125
Wire Wire Line
	5700 4125 5700 4375
Wire Wire Line
	5700 4375 5400 4375
Connection ~ 4800 4125
Text Notes 6200 4675 0    50   ~ 0
Use a independent PWM to controll the seconds\n\n
Text GLabel 3625 4875 0    50   Input ~ 0
P4
Text GLabel 4800 4875 0    50   Input ~ 0
P5
NoConn ~ 3600 3300
NoConn ~ 4775 3325
NoConn ~ 6025 3325
NoConn ~ 7250 3325
NoConn ~ 3625 4775
NoConn ~ 4800 4775
Wire Wire Line
	3625 4475 3625 4375
Connection ~ 3625 4275
Connection ~ 3625 4375
Wire Wire Line
	3625 4375 3625 4275
Wire Wire Line
	4800 4475 4800 4375
Connection ~ 4800 4275
Connection ~ 4800 4375
Wire Wire Line
	4800 4375 4800 4275
$EndSCHEMATC