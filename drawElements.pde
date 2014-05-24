
/********************************************************
 
 ROBOT STATUS
 
 ********************************************************/

void drawRobotStatus() {
  pushMatrix();
  translate(240, 510);
  text ("Robot data:", 0, -140);
  text ("x = " + RobotOne.x, 0, -120);
  text ("y = " + RobotOne.y, 0, -100);
  text ("vl = " + RobotOne.vl, 0, -80);
  text ("vr = " + RobotOne.vr, 0, -60);
  text ("v = " + RobotOne.v, 0, -40);
  text ("w = " + RobotOne.w, 0, -20);
  text ("motorValLeft = " + motorValLeft, 0, 0);
  text ("motorValRight = " + motorValRight, 0, 20);
  //println("  -------------------------     "+motorValLeft+"   "+motorValRight);
  popMatrix();
}


/*********************************
 
 CAMERA DATA TEXT
 
 **********************************/
int cameraDataYPos = -260;

void drawCameraData()
{
  fill(50, 255, 50, 100);
  pushMatrix();
  translate(25, 860);
  text("camera keys:", 0, cameraDataYPos);

  text("t,g       rotateX: "+rX, 5, cameraDataYPos+20);
  text("f,h       rotateY: "+rY, 5, cameraDataYPos+40);
  text("v,b      rotateZ: "+rZ, 5, cameraDataYPos+60);

  text("a,d      xpos: "+xpos, 5, cameraDataYPos+80);
  text("w,s       ypos: "+ypos, 5, cameraDataYPos+100);
  text("z,x      zpos: "+zpos, 5, cameraDataYPos+120);
 
  popMatrix();
}

/*********************************
 
 GRID
 
 **********************************/

int _WIDTH = 2000;
int _HEIGHT = 2000;

int squareSizeX = 100;
int squareSizeY = 100;

int squareW = _WIDTH/squareSizeX;
int squareH = _HEIGHT/squareSizeY;
int gridCounter;

void drawGrid() {
  pushMatrix();
  translate(0, 0, -20);

  // outline
  noFill();
  stroke(255, 25);
  strokeWeight(1);
  rect(0, 0, _WIDTH, _HEIGHT);

  for (int i = 0; i < _WIDTH; i += squareSizeX) {
    for (int j = 0; j < _HEIGHT; j += squareSizeY) {
      noFill();
      strokeWeight(2);
      stroke(255, 25);
      rect(i, j, squareSizeX, squareSizeY);   
      
      
      text(i+"   "+j, i, j);   
      
      
      gridCounter++;
    }
  }  
  popMatrix();
}

/*********************************
 
 AXES
 
 **********************************/

void drawAxles()
{
  stroke(0, 255, 0, 100);
  line(0, 0, 0, 200, 0, 0);
  text("x", 200, 0, 0);
  line(0, 0, 0, 0, 200, 0);
  text("y", 0, 200, 0);
  line(0, 0, 0, 0, 0, 200);
  text("z", 0, 0, 200);
}

/*********************************
 
 DRAW HELP TEXT
 
 **********************************/

void drawHelpText()
{
  fill(255, 50, 50, 175);
  text("press '0' to reset", checkXpos, checkYpos-120);
  text("press '9' to switch between autonomous / manual mode", checkXpos, checkYpos-105);
  fill(75, 150, 255, 175);
  text("press '1' to show / hide buttons", checkXpos, checkYpos-60);
  text("press '2' to draw camera info", checkXpos, checkYpos-40);
  text("press '3' to add trace points", checkXpos, checkYpos-20);
  text("press '4' to switch to 3D view", checkXpos, checkYpos);
  text("press '5' to show / hide grid", checkXpos, checkYpos+20);
  text("press '6' to show / hide motors", checkXpos, checkYpos+40);
  text("press '7' to show / hide robot", checkXpos, checkYpos+60);
  text("Points IDs: "+RobotOne.id, checkXpos, checkYpos+80);
}


/*********************************
 
 DRAW WHEEL
 
 **********************************/

void drawWheel()
{
  if (hidef)
    cylinder(2*R, 5, 15);
  else
    wheel(2*R);
}

void wheel(float r)
{
  pushMatrix();
  rotateX(radians(90));
  ellipse(0, 0, 2*r, 2*r);
  line(0, 0, 0, r);
  popMatrix();
}

/*********************************
 
 DRAW CHASSIS
 
 **********************************/

void drawChassis()
{
  if (hidef)
    box(L, L, 10);
  else
    rect(0, 0, L, L);
}


/*********************************
 
 DRAW SENSOR
 
 **********************************/

void drawSensor()
{
  if (hidef)
    box(20, 10, 5); 
  else
    rect(0, 0, 20, 10);
}


/*********************************
 
 CYLINDER FUNCTION
 
 http://wiki.processing.org/w/Cylinder
 
 **********************************/

void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];

  //get the x and z position on a circle for all the sides
  for (int i=0; i < x.length; i++) {
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0, -h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
  }

  endShape();

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0, h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], h/2, z[i]);
  }

  endShape();
}




