/************************
 
 ROBOT STUFF
 
 *************************/

float previousY = 0.01;
float dt = 1.0/30.0;
float velocityAmount;
float rotationAmount;
float rotationWheelLeft, rotationWheelRight;

int pathIntervalCounter;
int pathInterval = 0;

float R = 10; // wheel radius
float L = 50; // wheel distance

Robot RobotOne = new Robot (0, 0, 0, R, L);

ArrayList pontos; 

void RobotSetup()
{
  RobotOne.heading = -PI/2;
  RobotOne.vr = 3;
  RobotOne.vl = 2;
  pontos = new ArrayList();  
  pontos.add(new Ponto(0, 0, 0));
}

/********************************************************
 
 CALL MOVE + DRAW + PATH
 
 ********************************************************/

void RobotDraw()
{
  rectMode(CENTER);

  if (robotMove)
    RobotOne.Move();

  if (drawRobot)
    RobotOne.Draw();

  if (addPath && activePath) 
  {  
    if (pathIntervalCounter > pathInterval) {
      RobotOne.addPath();
      pathIntervalCounter = 0;
    }
    pathIntervalCounter++;
  }

  if (drawPath)
    RobotDrawPath();
}

/************************
 
 CLASS ROBOT
 
 *************************/

class Robot {
  float vl, vr; // left and right wheel velocity
  float v; // "unicycle" velocity
  float w; // angular velocity 

  float heading; // direction in radians;
  float x, y;
  float R; // wheel radius
  float L; // wheel distance

  int id;

  Robot (float _x, float _y, float _heading, float _r, float _l) {
    x = x;
    y = y;
    heading = _heading;
    vl = 0;
    vr = 0;
    v = 0;
    L = _l;
    R = _r;
  }

  void Draw () {

    pushMatrix();
    translate(width/2+x, height/2+y);

    rotate (heading);    

    strokeWeight(1);
    stroke(0, 150, 255, 220);
    fill(0, 150, 255, 50);

    // chassis
    drawChassis();

    //wheels
    pushMatrix();
    translate(0, -L/2-3);
    if (robotMove)
      rotateY(rotationWheelLeft -= (motorValLeft/50)/20);
    drawWheel();
    popMatrix();

    pushMatrix();
    translate(0, L/2+3);
    if (robotMove)
      rotateY(rotationWheelRight -= (motorValRight/50)/20);
    drawWheel();
    popMatrix();

    //sensor
    pushMatrix();
    translate(20, 0, 10);
    drawSensor();
    popMatrix();

    //rect (20, 0, 10, 10);

    popMatrix();
  }

  void addPath()
  {
    pontos.add(new Ponto(id, width/2+x, height/2+y));
    id++;
  }

  void Move() {
    // v =  R * (vr+vl)/2; 
    // w = (R/L) * (vl-vr);

    x += (v * cos(heading))*dt;
    y += (v * sin(heading))*dt;
    heading += w*dt; 

/*    velocityAmount = (motorValRight/50)+(motorValLeft/50);
    rotationAmount = (motorValRight/50)-(motorValLeft/50);
  */  
    int vel = 25;
    velocityAmount = (motorValRight/vel)+(motorValLeft/vel);
    rotationAmount = (motorValRight/vel)-(motorValLeft/vel);

    v = -velocityAmount*17;
    w = rotationAmount;

    vr =  R/2*(v/2 + w/L);
    vl =  R/2*(v/2 - w/L);

    //println(vr+"   "+vl+"   "+motorValLeft+"   "+motorValRight);
  }
}


/********************************************************
 
 ROBOT DRAW PATH
 
 ********************************************************/
void RobotDrawPath()
{
  stroke(0, 255, 150, 100);
  for (int i = pontos.size()-1; i >= 0; i--) { 
    Ponto ponto = (Ponto) pontos.get(i);    
    ponto.display();
    if (ponto.finished()) {
      pontos.remove(i);
    }
  }
}




/********************************************************
 
 ROBOT 3D STAGE
 
 ********************************************************/

void robotDrawStage()
{
  
  pushMatrix();
  translate(mainX, mainY, mainZ);
  
  if (cameraActive)
  {
    noFill();
    stroke(0, 255, 0, 100);

    pushMatrix();
   
    translate(width/2.0+xpos, height/2.0+ypos, zpos);

    rotateX(rX);
    rotateY(rY);
    rotateZ(rZ);

    /*
    stroke(255, 0, 0);
    rect(0, 0, 20, 20);
    */
    
   //translate(-600, -500);
    
    /*
    stroke(0, 255, 0);
    rect(0, 0, 20, 20);
    */
    
    if (gridActive)
      drawGrid();

    RobotDraw();

    popMatrix();
  } 
  else
  {
    if (gridActive)
      drawGrid();

    RobotDraw();
  }
  popMatrix();
}

