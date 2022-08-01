#include <Wire.h>
#include <AS5600.h>

AMS_5600 ams5600;
word startAngle = 0;
int ang, lang = 0;
 
void setup()
{
  Serial.begin(115200);
  Wire.begin();
  Serial.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> ");
  if(ams5600.detectMagnet() == 0 ){
    while(1){
        if(ams5600.detectMagnet() == 1 ){
            Serial.print("Current Magnitude: ");
            Serial.println(ams5600.getMagnitude());
            break;
        }
        else{
            Serial.println("Can not detect magnet");
        }
        delay(1000);
    }
  }
  ams5600.setStartPosition();
  ams5600.setEndPosition(360);
   word zero = ams5600.setStartPosition();
   int burntimes = ams5600.getBurnCount();
   Serial.println("Set angle");
   Serial.println(burntimes);
  //ams5600.burnAngle();

  delay(50);
}
/*******************************************************
/* Function: convertRawAngleToDegrees
/* In: angle data from AMS_5600::getRawAngle
/* Out: human readable degrees as float
/* Description: takes the raw angle and calculates
/* float value in degrees.
/*******************************************************/
float convertRawAngleToDegrees(word newAngle)
{
  /* Raw data reports 0 - 4095 segments, which is 0.087 of a degree */
  float retVal = newAngle * 0.087;
  ang = retVal;
  return ang;
}
void loop()
{
  
    Serial.println(String(convertRawAngleToDegrees(ams5600.getRawAngle()),DEC));
    //Serial.println(ams5600.getAgc());
}
