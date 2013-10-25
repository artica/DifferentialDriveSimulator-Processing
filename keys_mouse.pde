void getKey() 
{

  switch(key) {
    
    /**********************
    
      main translate keys
    
    ***********************/
    
    case 'o': 
      mainY  -= 5;
      break;
    
    case 'l': 
      mainY  += 5;
      break;
      
    case 'k': 
      mainX  -= 5;
      break;
      
    case 'ç': 
      mainX  += 5;
      break;
      
    case 'n': 
      mainZ  -= 5;
      break;
      
    case 'm': 
      mainZ  += 5;
      break;
    
    /**********************
    
      rotate keys
    
    ***********************/
    
    
    case 'v': 
      rZ  += .025;
      break;
    
    case 'b': 
      rZ  -= .025;
      break;
      
    case 'h': 
      rY  += .025;
      break;
    
    case 'f': 
      rY  -= .025;
      break;
      
    case 't': 
      rX  += .025;
      break;
    
    case 'g': 
      rX  -= .025;
      break;
    
    
    /**********************
    
      translate keys
    
    ***********************/

    case 'd': 
      xpos  += inc;
      break;
    
    case 'a': 
      xpos  -= inc;
      break;
    
    case 's': 
      ypos  += inc;
      break;
    
    case 'w': 
      ypos  -= inc;
      break;

    case 'z': 
      zpos  += inc;
      break;
    
    case 'x': 
      zpos  -= inc;
      break;
    
    
    /**********************
    
      camera keys
    
    ***********************/
    /*
    // eye X Y Z  

  case '1': 
    eyeX  += inc;
    break;

  case '2': 
    eyeX  -= inc;
    break;

  case '3': 
    eyeY  += inc;
    break;

  case '4': 
    eyeY  -= inc;
    break;

  case '5': 
    eyeZ  += inc;
    break;

  case '6': 
    eyeZ  -= inc;
    break;

    // center X Y Z

  case 'q': 
    centerX  += inc;
    break;

  case 'w': 
    centerX  -= inc;
    break;

  case 'e': 
    centerY  += inc;
    break;

  case 'r': 
    centerY  -= inc;
    break;

  case 't': 
    centerZ  += inc;
    break;

  case 'y': 
    centerZ  -= inc;
    break;

    // up X Y Z
  
  case 'a': 
     upX  += .2;
     break;
     
  case 's': 
     upX  -= .2;
     break;
     
  case 'd': 
     upY  += .2;
     break;
     
  case 'f': 
     upY  -= .2;
     break;
     
  case 'g': 
     upZ  += .2;
     break;
     
  case 'h': 
     upZ  -= .2;
     break;
     */
  }
}

/********************************************************

    MOUSE

********************************************************/

void mousePressed() 
{
}

/********************************************************

    KEY RELEASED

********************************************************/

public void keyReleased() {
  //previousY = 0;
  if (key == '0') { // reset all
    RobotOne.x = 0;
    RobotOne.y = 0;
    RobotOne.v = 0;
    RobotOne.w = 0;
    RobotOne.heading = -PI/2;

    for (int i = pontos.size()-1; i >= 0; i--) { 
      Ponto ponto = (Ponto) pontos.get(i);
      pontos.remove(i);
      RobotOne.id = 0;
    }
  } 
    
  if (key == '3') 
      addPath = !addPath;
  
  if (key == '1') 
      drawHelpStuff = !drawHelpStuff;
      
  if (key == '2') 
      drawCameraDebug = !drawCameraDebug;
      
  if (key == '4') 
      cameraActive = !cameraActive;
      
  if (key == '5') 
      gridActive = !gridActive;
      
  if (key == '6') 
      drawMotorsValues = !drawMotorsValues;
      
  if (key == '7') 
      drawRobot = !drawRobot;
  
  if (key == 'u')
  {
    beginRecord(PDF, "filename.pdf"); 
   RobotDrawPath();
    endRecord();
  }
      
  
} 

