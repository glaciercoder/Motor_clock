  #define FASTLED_INTERNAL
#define NUM_LEDS 3
#define LED_TYPE WS2812
#define COLOR_ORDER GRB
#define TCAADDR 0x70
#define ENCADDR 0x36
#include <Wire.h>
#include<DS3231.h>
#include <TimerOne.h>
#include <AS5600.h>
#include <FastLED.h>
DS3231 clock_for_motor;
CRGB leds[NUM_LEDS];

//Pin def
const int step_H_1 = 9;
const int step_H_2 = 2;
const int step_M_1 = 3;
const int step_M_2 = 4;
const int step_S_1 = 5;
const int step_S_2 = 6;
const int dirPin = 10;
const int LED_DATA = 7;
const int Buzzer = 8;
AS5600 encoder[6];

//state machine
bool State_H_1 = 0;
bool State_H_2 = 0;
bool State_M_1 = 0;
bool State_M_2 = 0;
bool State_S_1 = 0;
bool State_S_2 = 0;
bool ENA_H_1 = 0;
bool ENA_H_2 = 0;
bool ENA_M_1 = 0;
bool ENA_M_2 = 0;
bool ENA_S_1 = 0;
//Intervals
//1.8 degrees per step (ms = 1/8)
//1s 20 x 8 steps
//1 step for 6250us
const unsigned long interval_s = 250;//
const unsigned long interval_m = 2 * interval_s;
const unsigned long interval_h = 5 * interval_s;
unsigned long  micros_s = 0;
unsigned long  micros_m_2 = 0;
unsigned long  micros_m_1 = 0;
unsigned long  micros_h_2 = 0;
unsigned long  micros_h_1 = 0;


//timer vars
int time_for_motor[3];
int angle[6];//angle 0-5 for s2,21,m2,m1,h2,n1 respectively
bool h12 = false;
bool apm;


void setup() {
  pinMode(step_H_1, OUTPUT);
  pinMode(step_H_2, OUTPUT);
  pinMode(step_M_1, OUTPUT);
  pinMode(step_M_2, OUTPUT);
  pinMode(step_S_1, OUTPUT);
  pinMode(step_S_2, OUTPUT);
  pinMode(dirPin, OUTPUT);
  digitalWrite(dirPin, LOW);
  Wire.begin();
  Serial.begin(115200);
  LEDS.addLeds<LED_TYPE, LED_DATA, COLOR_ORDER>(leds, NUM_LEDS);
  FastLED.setBrightness(255);
  Encoder_init();
  
  while (Serial.available() > 0) {
    Serial.flush();
  }
  Time_Init(time_for_motor);
  Timer1.initialize(interval_s); //Initialize timer with 1 second period
  Timer1.attachInterrupt(PWM_s);  
}

void loop() {
  ENA_S_1 = ENA_H_1 =  ENA_H_2 = ENA_M_1 = ENA_M_2 = 0;
  CheckState(ENA_H_1, ENA_H_2, ENA_M_1, ENA_M_2, ENA_S_1, time_for_motor);
  if (ENA_S_1)
    if (micros() - micros_s > interval_s) {
      State_S_1 = !State_S_1;
      digitalWrite(step_S_1, State_S_2 ? HIGH : LOW);
      micros_s = micros();
    }

  if (ENA_M_2)
    if (micros() - micros_m_2 > interval_m) {
      State_M_2 = !State_M_2;
      digitalWrite(step_M_2, State_M_2 ? HIGH : LOW);
      micros_m_2 = micros();
    }

  if (ENA_M_1)
    if (micros() - micros_m_1 > interval_m) {
      State_M_1 = !State_M_1;
      digitalWrite(step_M_1, State_M_2 ? HIGH : LOW);
      micros_m_1 = micros();
    }

  if (ENA_H_2)
    if (micros() - micros_h_2 > interval_h) {
      State_H_2 = !State_H_2;
      digitalWrite(step_H_2, State_H_2 ? HIGH : LOW); 
      micros_h_2 = micros();
    }

  if (ENA_H_1)
    if (micros() - micros_h_1 > interval_h) {
      State_H_1 = !State_H_1;
      digitalWrite(step_H_1, State_H_1 ? HIGH : LOW);
      micros_h_1 = micros();
    }


  time_for_motor[0] = clock_for_motor.getHour(h12, apm);
  time_for_motor[1] = clock_for_motor.getMinute();
  time_for_motor[2] = clock_for_motor.getSecond();
  Readangle(angle);
  printTime(time_for_motor);
}


void clock_for_motorRun(void){
  if (ENA_S_1)
    if (micros() - micros_s > interval_s) {
      State_S_1 = !State_S_1;
      digitalWrite(step_S_1, State_S_2 ? HIGH : LOW);
      micros_s = micros();
    }

  if (ENA_M_2)
    if (micros() - micros_m_2 > interval_m) {
      State_M_2 = !State_M_2;
      digitalWrite(step_M_2, State_M_2 ? HIGH : LOW);
      micros_m_2 = micros();
    }

  if (ENA_M_1)
    if (micros() - micros_m_1 > interval_m) {
      State_M_1 = !State_M_1;
      digitalWrite(step_M_1, State_M_2 ? HIGH : LOW);
      micros_m_1 = micros();
    }

  if (ENA_H_2)
    if (micros() - micros_h_2 > interval_h) {
      State_H_2 = !State_H_2;
      digitalWrite(step_H_2, State_H_2 ? HIGH : LOW); 
      micros_h_2 = micros();
    }

  if (ENA_H_1)
    if (micros() - micros_h_1 > interval_h) {
      State_H_1 = !State_H_1;
      digitalWrite(step_H_1, State_H_1 ? HIGH : LOW);
      micros_h_1 = micros();
    }
}

void PWM_s(void) {
  State_S_2 = !State_S_2;
  digitalWrite(step_S_2, State_S_2 ? HIGH : LOW);
  digitalWrite(Buzzer, State_S_2 ? HIGH : LOW);
}

void tcaselect(uint8_t i){
  if(i > 7) return;
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << i);
  Wire.endTransmission();
}

void Readangle(int angle[]){
  for(int i = 0;i < 6;i++){
    tcaselect(i);
    Wire.beginTransmission(ENCADDR);
    if (!Wire.endTransmission()){
      angle[i] = encoder[i].readAngle();
          Serial.print("Angle "); Serial.print(i);Serial.print(" = ");Serial.println(angle[i]);
    }
  }               
}

void convert_angle(int startangle[],int time_for_motor[]){
  startangle[0] = time_for_motor[0] / 10 * 36;
  startangle[1] = time_for_motor[0] % 10 * 36;
  startangle[2] = time_for_motor[1] / 10 * 36;
  startangle[3] = time_for_motor[1] % 10 * 36;
  startangle[4] = time_for_motor[2] / 10 * 36;
  startangle[5] = time_for_motor[2] % 10 * 36;  
}

bool CompareAngle(int startangle[], int angle[]){
  bool equal = true;
  for(int i = 0;i < 6;i++){
    equal  = equal && ((abs(startangle[i] - angle[i])) < 1);
  }
  return equal;
}

void Time_Init(int time_for_motor[])
{
  byte index = 0;
  char endMarker = '\n';
  char rc;
  char Serial_Res[6];
  Serial.print("Set the time:\n");

  while (true) {
    while (Serial.available() == 0);
    rc = Serial.read();
    if (rc != endMarker)
      Serial_Res[index++] = rc;
    else
      break;
  }

  time_for_motor[0] = (Serial_Res[0] - '0') * 10 + (Serial_Res[1] - '0');
  time_for_motor[1] = (Serial_Res[2] - '0') * 10 + (Serial_Res[3] - '0');
  time_for_motor[2] = (Serial_Res[4] - '0') * 10 + (Serial_Res[5] - '0');
  clock_for_motor.setSecond(time_for_motor[2]);//Set the second
  clock_for_motor.setMinute(time_for_motor[1]);//Set the minute
  clock_for_motor.setHour(time_for_motor[0]);  //Set the hour
  Serial.print("Time Set::");
  printTime(time_for_motor);

  micros_s = micros();
  micros_m_2 = micros();
  micros_m_1 = micros();
  micros_h_2 = micros();
  micros_h_1 = micros();
  //Checkclock_for_motor(time);
}



//closed loop control
void Checkclock_for_motor(int time_for_motor[]){
  int startangle[6];
  convert_angle(startangle, time_for_motor);
  Readangle(angle);
  ENA_H_1 = ENA_H_2 = ENA_M_1 = ENA_M_2 = ENA_S_1 = 1;
  Timer1.attachInterrupt(PWM_s);
  while(! CompareAngle(startangle, angle)){
     if((abs(startangle[0] - angle[0])) < 1) ENA_H_1 = 0;
     if((abs(startangle[1] - angle[1])) < 1) ENA_H_2 = 0;
     if((abs(startangle[2] - angle[2])) < 1) ENA_M_1 = 0;
     if((abs(startangle[3] - angle[3])) < 1) ENA_M_2 = 0;
     if((abs(startangle[4] - angle[4])) < 1) ENA_S_1 = 0;
     if((abs(startangle[5] - angle[5])) < 1) Timer1.detachInterrupt();
     clock_for_motorRun();
  }
}
void CheckState(bool& ENAH1, bool& ENAH2, bool& ENAM1, bool& ENAM2, bool& ENAS1, int time_for_motor[])
{
  ENAS1 = (time_for_motor[2] % 10 == 9) ? true : false;
  ENAM2 = (time_for_motor[2] >= 58) ? true : false;
  ENAM1 = ((time_for_motor[1] % 10 == 9) && (time_for_motor[2] >= 58)) ? true : false;
  ENAH2 = ((time_for_motor[1] == 59) && (time_for_motor[2] >= 55) ) ? true : false;
  ENAH1 = ((time_for_motor[0] % 10 == 9) && (time_for_motor[2] >= 55)) ? true : false;
}


void Encoder_init(){
  for (uint8_t t=0; t<6; t++) {
      tcaselect(t);
      Serial.print("TCA Port #"); Serial.println(t);
      Wire.beginTransmission(ENCADDR);
      if (!Wire.endTransmission()) {
          Serial.print("Found Encoder "); Serial.println(t);
      }
  }  
  Serial.println("\ndone");
}


float convertRawAngleToDegrees(word newAngle)
{
  /* Raw data reports 0 - 4095 segments, which is 0.087 of a degree */
  float retVal = newAngle * 0.087;
  int ang = retVal;
  return ang;
}

void printTime(int time_for_motor[]){
  Serial.print(time_for_motor[0], DEC);
  Serial.print(':');
  Serial.print(time_for_motor[1], DEC);
  Serial.print(':');
  Serial.print(time_for_motor[2], DEC);
  Serial.print("\n");
}
