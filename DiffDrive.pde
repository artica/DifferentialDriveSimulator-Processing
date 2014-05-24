int delayCounter = 0;
int delayMaxCounter = (int)random(2000);
int diffDriveState = 0;

int motorSpeedLeftTemp = (int)random(-255, 255);
int motorSpeedRightTemp = (int)random(-255, 255);

float motorSpeedLeft,  motorSpeedRight;
float filter = 0.025;


void DiffDriveProgram()
{
 
  if (diffDriveState == 0)
  {
    if(delayCounter < diffDriveState)
    {
      delayCounter++;
       DiffDrive((int)motorSpeedLeft, (int)motorSpeedRight);
    }
    else
    {
      delayCounter=0;
      delayMaxCounter = (int)random(250);
      diffDriveState++;
      
      motorSpeedLeftTemp = (int)random(250);
      motorSpeedRightTemp = (int)random(250);
      
      
    }
  }
  
  if (diffDriveState == 1)
  {
    if(delayCounter < delayMaxCounter)
    {
      delayCounter++;
        DiffDrive((int)motorSpeedLeft, (int)motorSpeedRight);
    }
    else
    {
      delayCounter=0;
      delayMaxCounter = (int)random(1250);
      diffDriveState=0;
      
      motorSpeedLeftTemp = (int)random(-255, 255);
      motorSpeedRightTemp = (int)random(-255, 255);
    }
  }
  
  motorSpeedLeft = motorSpeedLeft * (1.0-filter) + motorSpeedLeftTemp * filter;
  motorSpeedRight = motorSpeedRight * (1.0-filter) + motorSpeedRightTemp * filter;
  
  println(motorSpeedLeft);
  
}










void DiffDrive(int _ml, int _mr)
{
  motorValLeft = (int)map(_ml, 255, -255, -50, 50);
  motorValRight = (int)map(_mr, 255, -255, -50, 50);
}

