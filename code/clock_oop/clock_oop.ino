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
// RGB LEDs
CRGB leds[NUM_LEDS];
const int LED_DATA = 7;

// Buzzer
const int Buzzer = 8;

// Motor index
enum Index {H_L, H_R, M_L, M_R, S_L, S_R};
const int motor_num = 6;
const int Motor_pin[motor_num] = {9, 2, 3, 4, 5, 6};

//state machine
class StateMachine{
private:
    bool State[motor_num];
public:

};
/*******************************
 * Motor: closed control useing AS5600
 * Control by position loop
 * *****************************/
// Periods caculation:
//1.8 degrees per step (ms = 1/8) 
// One number lasts for 36 degree, namely 20 * 8 = 160 steps
// For SR, we want it to rotate constantly, period = 6250 us
// For SL, we want it to just rotate at the 9th second, and finish rotating in one second, period = 6250
// For ML and MR, we want it to rotate at the 8th second, and finish rotating in two seconds, period = 2 * base 
// For HL and HR, we want it to rotate at the 5th second, and finish rotating in five seconds, period = 5 * base  
class PWM{
private:
    const static int gear_ratio = 25; // ratio of gear and motor
    const static int base_period = 6250; //period of SR
    unsigned long period; 
    bool level = 0;
public:
    PWM() = delete;
    PWM(Index index);
    ~PWM() = default;
    unsigned long get_period(){return period;}
    bool get_level(){return level;}
    void flip(){level = !level;}
};
PWM::PWM(Index index){
    switch (index)
    {
        case S_R:
        case S_L:
            period = base_period / gear_ratio;     
            break;
        case M_L: 
        case M_R:
            period = 2 * base_period / gear_ratio;
            break;
        case H_L:
        case H_R:
            period = 5 * base_period / gear_ratio;
            break;
        default:
            break;
    }
}

class Motor{
private:
    Index index;
    bool ENA;
    int angle;
    AS5600 Encoder;
public:
    PWM pwm;
    const int pin;
    Motor() = default;
    Motor(Index _index):index(_index), pin(Motor_pin[_index]), ENA(false),pwm(_index){};
    ~Motor() = default;
    void Init();
    void tcaselect();
    void enable(){ENA = true;}
    void disable(){ENA = false;}
    bool ifEnabled(){return ENA;}
    const static int dirPin = 10;
};

void Motor::tcaselect(){
    int i = index;
    if(i > motor_num) return;
    Wire.beginTransmission(TCAADDR);
    Wire.write(1 << i);
    Wire.endTransmission();
}

void Motor::Init(){
    pinMode(pin, OUTPUT);
    digitalWrite(dirPin, LOW);

    tcaselect();
    Serial.print("TCA Port #"); Serial.println(index);
    Wire.beginTransmission(ENCADDR);
    if (!Wire.endTransmission()) {
        Serial.print("Found Encoder "); Serial.println(index);
    }
    else{
        Serial.println("Motor "); Serial.print(index); Serial.println("'s Encoder not found");
    }
}

Motor Motors[] = {Motor(H_L), Motor(H_R),Motor(M_L),Motor(M_R),Motor(S_L),Motor(S_R)};

/*****************************************
 * Time displayed by the motor  
 * getTime from DS3231  
 * ****************************************/
// Clock DS3231
DS3231 ds3231;
bool h12 = false; // don't use 12 hours mode
bool apm; // useless under non 12 hours mode

class Motor_Time{
private:
   // Number for each motor
   int time_number[motor_num]; 
   // Time to control the rotation of the motor
   unsigned long time_micros[motor_num];
public:
    Motor_Time() = default;
    ~Motor_Time() = default;
    void Init();
    void getTime();
    void printTime();
    void ChangeState(Motor Motors[]);
    void setup_motor(Motor Motors[]);
};

void Motor_Time::Init(){
    byte index = 0;
    char endMarker = '\n';
    char rc;
    char Serial_Res[motor_num];
    Serial.print("Set the time(Format:xxxxxx\\n):\n");
  
    while (true) {
      while (Serial.available() == 0);
      rc = Serial.read();
      if (rc != endMarker)
        Serial_Res[index++] = rc;
      else
        break;
    }
    for (int i = 0; i < motor_num; i++)
        time_number[i] = (Serial_Res[i] - '0') ; 
    
    ds3231.setSecond((time_number[0] - '0') * 10 + (time_number[1] - '0'));//Set the second
    ds3231.setMinute((time_number[2] - '0') * 10 + (time_number[3] - '0'));//Set the minute
    ds3231.setHour((time_number[4] - '0') * 10 + (time_number[5] - '0'));  //Set the hour
    Serial.print("Time Set:");
    printTime();
    for (int i = 0; i < motor_num; i++)
        time_micros[i] = micros();
}

void Motor_Time::getTime(){
    int ds3231_time[3];
    ds3231_time[0] = ds3231.getHour(h12, apm);
    ds3231_time[1] = ds3231.getMinute();
    ds3231_time[2] = ds3231.getSecond();
    for (int i = 0; i < motor_num; i++)
        if(i % 2) time_number[i] = ds3231_time[i / 2] % 10;
        else time_number[i] = ds3231_time[i / 2] / 10;
}

void Motor_Time::printTime(){
    Serial.print(time_number[0], DEC);
    Serial.print(time_number[1], DEC);
    Serial.print(':');
    Serial.print(time_number[2], DEC);
    Serial.print(time_number[3], DEC);
    Serial.print(':');
    Serial.print(time_number[4], DEC);
    Serial.print(time_number[5], DEC);
    Serial.print("\n");
}

void Motor_Time::ChangeState(Motor Motors[]){
    (time_number[S_R] == 9) ? Motors[S_L].enable() : Motors[S_L].disable(); 
    if((time_number[S_L] == 5) && (time_number[S_L] == 8)){
       Motors[M_R].enable();
       if(time_number[M_R] == 9) Motors[M_L].enable(); 
       else Motors[M_L].disable();
    }
    else Motors[M_R].disable();
    if((time_number[M_L] == 5) && (time_number[M_R] == 9) && (time_number[S_L] == 5) && (time_number[S_L] == 5)){
        Motors[H_R].enable();
        if(time_number[H_R] == 9) Motors[H_L].enable();
        else Motors[H_L].disable();
    }
    else Motors[H_R].disable();
}

void Motor_Time::setup_motor(Motor Motors[]){
    ChangeState(Motors);
    for (int i = 0; i < motor_num; i++)
    {
        if(Motors[i].ifEnabled())
            if(micros() - time_micros[i] > (Motors[i].pwm.get_period() / 2)){
                Motors[i].pwm.flip();
                digitalWrite(Motors[i].pin, Motors[i].pwm.get_level());
                time_micros[i] = micros();
            }
    }
}

Motor_Time motor_time;

void setup() {
    Wire.begin();
    Serial.begin(115200);
    for (int i = 0; i < motor_num; i++)
      Motors[i].Init();
    //LEDS.addLeds<LED_TYPE, LED_DATA, COLOR_ORDER>(leds, NUM_LEDS);
    //FastLED.setBrightness(255);
    while (Serial.available() > 0) {
      Serial.flush();
    }
    motor_time.Init();
    Timer1.initialize(Motors[S_R].pwm.get_period() / 2); //Initialize timer with half period of SR
    Timer1.attachInterrupt(PWM_SR);  
}

void loop() {
    motor_time.getTime();
    //motor_time.printTime();
    motor_time.setup_motor(Motors);
   
//  Readangle(angle);
}

void PWM_SR(void) {
    Motors[S_R].pwm.flip();
    digitalWrite(Motors[S_R].pin, Motors[S_R].pwm.get_level());
}
//
//
//
//void Readangle(int angle[]){
//  for(int i = 0;i < 6;i++){
//    tcaselect(i);
//    Wire.beginTransmission(ENCADDR);
//    if (!Wire.endTransmission()){
//      angle[i] = encoder[i].readAngle();
//          Serial.print("Angle "); Serial.print(i);Serial.print(" = ");Serial.println(angle[i]);
//    }
//  }               
//}
//
//void convert_angle(int startangle[],int time_for_motor[]){
//  startangle[0] = time_for_motor[0] / 10 * 36;
//  startangle[1] = time_for_motor[0] % 10 * 36;
//  startangle[2] = time_for_motor[1] / 10 * 36;
//  startangle[3] = time_for_motor[1] % 10 * 36;
//  startangle[4] = time_for_motor[2] / 10 * 36;
//  startangle[5] = time_for_motor[2] % 10 * 36;  
//}
//
//bool CompareAngle(int startangle[], int angle[]){
//  bool equal = true;
//  for(int i = 0;i < 6;i++){
//    equal  = equal && ((abs(startangle[i] - angle[i])) < 1);
//  }
//  return equal;
//}
//
////closed loop control
//void Checkds3231(int time_for_motor[]){
//  int startangle[6];
//  convert_angle(startangle, time_for_motor);
//  Readangle(angle);
//  ENA_H_1 = ENA_H_2 = ENA_M_1 = ENA_M_2 = ENA_S_1 = 1;
//  Timer1.attachInterrupt(PWM_s);
//  while(! CompareAngle(startangle, angle)){
//     if((abs(startangle[0] - angle[0])) < 1) ENA_H_1 = 0;
//     if((abs(startangle[1] - angle[1])) < 1) ENA_H_2 = 0;
//     if((abs(startangle[2] - angle[2])) < 1) ENA_M_1 = 0;
//     if((abs(startangle[3] - angle[3])) < 1) ENA_M_2 = 0;
//     if((abs(startangle[4] - angle[4])) < 1) ENA_S_1 = 0;
//     if((abs(startangle[5] - angle[5])) < 1) Timer1.detachInterrupt();
//     ds3231Run();
//  }
//}
//
//float convertRawAngleToDegrees(word newAngle)
//{
//  /* Raw data reports 0 - 4095 segments, which is 0.087 of a degree */
//  float retVal = newAngle * 0.087;
//  int ang = retVal;
//  return ang;
//}
//