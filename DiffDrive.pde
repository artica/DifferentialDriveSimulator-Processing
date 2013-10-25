int delayCounter = 0;
int delayMaxCounter = (int)random(2000);
int diffDriveState = 0;

int motorSpeedLeft = (int)random(-255, 255);
int motorSpeedRight = (int)random(-255, 255);

void DiffDriveProgram()
{
 
  if (diffDriveState == 0)
  {
    if(delayCounter < diffDriveState)
    {
      delayCounter++;
       DiffDrive(motorSpeedLeft, motorSpeedRight);
    }
    else
    {
      delayCounter=0;
      delayMaxCounter = (int)random(250);
      diffDriveState++;
      
      motorSpeedLeft = (int)random(250);
      motorSpeedRight = (int)random(250);
      
      
    }
  }
  
  if (diffDriveState == 1)
  {
    if(delayCounter < delayMaxCounter)
    {
      delayCounter++;
        DiffDrive(motorSpeedLeft, motorSpeedRight);
    }
    else
    {
      delayCounter=0;
      delayMaxCounter = (int)random(1250);
      diffDriveState=0;
      
      motorSpeedLeft = (int)random(-255, 255);
      motorSpeedRight = (int)random(-255, 255);
    }
  }
  
  
  
}





void DiffDrive(int _ml, int _mr)
{
  //println("--------------      "+_ml+"   "+_mr);
  motorValLeft = (int)map(_ml, 255, -255, -50, 50);
  motorValRight = (int)map(_mr, 255, -255, -50, 50);
  //println("       "+motorValLeft+"   "+motorValRight);
}

