EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L TPS561208DDCR:TPS561208DDCR VR?
U 1 1 60EF918F
P 5425 4025
AR Path="/60EF918F" Ref="VR?"  Part="1" 
AR Path="/60EF4BAF/60EF918F" Ref="VR1"  Part="1" 
F 0 "VR1" H 5425 4692 50  0000 C CNN
F 1 "TPS561208DDCR" H 5425 4601 50  0000 C CNN
F 2 "TPS561208DDCR:SOT95P280X110-6N" H 5425 4025 50  0001 L BNN
F 3 "" H 5425 4025 50  0001 L BNN
F 4 "IPC-7351B" H 5425 4025 50  0001 L BNN "STANDARD"
F 5 "1.10 mm" H 5425 4025 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "Texas Instruments" H 5425 4025 50  0001 L BNN "MANUFACTURER"
F 7 "April 2017" H 5425 4025 50  0001 L BNN "PARTREV"
	1    5425 4025
	1    0    0    -1  
$EndComp
Text GLabel 4125 3625 0    50   Input ~ 0
12V
$Comp
L Device:C_Small C?
U 1 1 60EF9196
P 4175 3925
AR Path="/60EF9196" Ref="C?"  Part="1" 
AR Path="/60EF4BAF/60EF9196" Ref="C7"  Part="1" 
F 0 "C7" H 4267 3971 50  0000 L CNN
F 1 "22u" H 4267 3880 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4175 3925 50  0001 C CNN
F 3 "~" H 4175 3925 50  0001 C CNN
	1    4175 3925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60EF919C
P 4175 4175
AR Path="/60EF919C" Ref="#PWR?"  Part="1" 
AR Path="/60EF4BAF/60EF919C" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 4175 3925 50  0001 C CNN
F 1 "GND" H 4180 4002 50  0000 C CNN
F 2 "" H 4175 4175 50  0001 C CNN
F 3 "" H 4175 4175 50  0001 C CNN
	1    4175 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4125 3625 4175 3625
Wire Wire Line
	4175 3625 4175 3825
Wire Wire Line
	4175 4025 4175 4175
Wire Wire Line
	4175 3625 4275 3625
Connection ~ 4175 3625
$Comp
L Device:L_Small L?
U 1 1 60EF91A7
P 6500 3825
AR Path="/60EF91A7" Ref="L?"  Part="1" 
AR Path="/60EF4BAF/60EF91A7" Ref="L1"  Part="1" 
F 0 "L1" V 6685 3825 50  0000 C CNN
F 1 "4.7uH" V 6594 3825 50  0000 C CNN
F 2 "Inductor_SMD:L_Coilcraft_XAL5030" H 6500 3825 50  0001 C CNN
F 3 "~" H 6500 3825 50  0001 C CNN
	1    6500 3825
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60EF91AD
P 6700 4225
AR Path="/60EF91AD" Ref="R?"  Part="1" 
AR Path="/60EF4BAF/60EF91AD" Ref="R7"  Part="1" 
F 0 "R7" H 6759 4271 50  0000 L CNN
F 1 "10k" H 6759 4180 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6700 4225 50  0001 C CNN
F 3 "~" H 6700 4225 50  0001 C CNN
	1    6700 4225
	1    0    0    -1  
$EndComp
Text GLabel 6200 3475 1    50   Input ~ 0
VBST
Text GLabel 4725 3825 0    50   Input ~ 0
VBST
Text GLabel 6600 4100 0    50   Input ~ 0
VFB
Text GLabel 4725 4125 0    50   Input ~ 0
VFB
Wire Wire Line
	4400 3625 4400 4025
Wire Wire Line
	4400 4025 4725 4025
Connection ~ 4400 3625
Wire Wire Line
	4400 3625 4725 3625
$Comp
L Device:C_Small C?
U 1 1 60EF91BB
P 6200 3625
AR Path="/60EF91BB" Ref="C?"  Part="1" 
AR Path="/60EF4BAF/60EF91BB" Ref="C8"  Part="1" 
F 0 "C8" H 6292 3671 50  0000 L CNN
F 1 "0.1uF" H 6292 3580 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6200 3625 50  0001 C CNN
F 3 "~" H 6200 3625 50  0001 C CNN
	1    6200 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3825 6200 3825
Wire Wire Line
	6200 3825 6200 3725
Wire Wire Line
	6200 3525 6200 3475
Wire Wire Line
	6200 3825 6400 3825
Connection ~ 6200 3825
Wire Wire Line
	6600 3825 6700 3825
Wire Wire Line
	6700 4075 6700 4100
Wire Wire Line
	6125 4325 6700 4325
Wire Wire Line
	6600 4100 6700 4100
Connection ~ 6700 4100
Wire Wire Line
	6700 4100 6700 4125
$Comp
L Device:C_Small C?
U 1 1 60EF91CC
P 6900 4050
AR Path="/60EF91CC" Ref="C?"  Part="1" 
AR Path="/60EF4BAF/60EF91CC" Ref="C9"  Part="1" 
F 0 "C9" H 6992 4096 50  0000 L CNN
F 1 "47uF" H 6992 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6900 4050 50  0001 C CNN
F 3 "~" H 6900 4050 50  0001 C CNN
	1    6900 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3875 6700 3825
$Comp
L Device:R_Small R?
U 1 1 60EF91D3
P 6700 3975
AR Path="/60EF91D3" Ref="R?"  Part="1" 
AR Path="/60EF4BAF/60EF91D3" Ref="R6"  Part="1" 
F 0 "R6" H 6759 4021 50  0000 L CNN
F 1 "56.2k" H 6759 3930 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 6700 3975 50  0001 C CNN
F 3 "~" H 6700 3975 50  0001 C CNN
	1    6700 3975
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60EF91D9
P 7050 3925
AR Path="/60EF91D9" Ref="R?"  Part="1" 
AR Path="/60EF4BAF/60EF91D9" Ref="R8"  Part="1" 
F 0 "R8" H 7109 3971 50  0000 L CNN
F 1 "1k" H 7109 3880 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7050 3925 50  0001 C CNN
F 3 "~" H 7050 3925 50  0001 C CNN
	1    7050 3925
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 60EF91DF
P 7050 4175
AR Path="/60EF91DF" Ref="D?"  Part="1" 
AR Path="/60EF4BAF/60EF91DF" Ref="D1"  Part="1" 
F 0 "D1" V 7089 4057 50  0000 R CNN
F 1 "LED" V 6998 4057 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7050 4175 50  0001 C CNN
F 3 "~" H 7050 4175 50  0001 C CNN
	1    7050 4175
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60EF91E5
P 7275 3825
AR Path="/60EF91E5" Ref="#PWR?"  Part="1" 
AR Path="/60EF4BAF/60EF91E5" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 7275 3675 50  0001 C CNN
F 1 "+5V" V 7290 3953 50  0000 L CNN
F 2 "" H 7275 3825 50  0001 C CNN
F 3 "" H 7275 3825 50  0001 C CNN
	1    7275 3825
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3825 6900 3825
Connection ~ 6700 3825
Wire Wire Line
	6900 3950 6900 3825
Connection ~ 6900 3825
Wire Wire Line
	6900 3825 7050 3825
Wire Wire Line
	6700 4325 6900 4325
Connection ~ 6700 4325
Wire Wire Line
	6900 4150 6900 4325
Connection ~ 6900 4325
Wire Wire Line
	6900 4325 7050 4325
Wire Wire Line
	7050 3825 7275 3825
Connection ~ 7050 3825
$Comp
L power:GND #PWR0135
U 1 1 60EACEC3
P 6900 4325
F 0 "#PWR0135" H 6900 4075 50  0001 C CNN
F 1 "GND" H 6905 4152 50  0000 C CNN
F 2 "" H 6900 4325 50  0001 C CNN
F 3 "" H 6900 4325 50  0001 C CNN
	1    6900 4325
	1    0    0    -1  
$EndComp
Text GLabel 4275 3450 1    50   Input ~ 0
VM
Wire Wire Line
	4275 3450 4275 3625
Connection ~ 4275 3625
Wire Wire Line
	4275 3625 4400 3625
$EndSCHEMATC
