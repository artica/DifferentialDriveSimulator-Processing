/*********************************

  JOYSTICK DETECT MOUSE INTERACTION

**********************************/

void joystickDetectInteraction()
{
  // check if the mouse is inside the joystick area
  if (mouseX > joyDisplayCenterX-curJoyDisplayWidth/2-50 &&
    mouseX < (joyDisplayCenterX-curJoyDisplayWidth/2-50)+(curJoyDisplayWidth+100) &&
    mouseY > joyDisplayCenterY-curJoyDisplayHeight/2-50 &&
    mouseY < (joyDisplayCenterY-curJoyDisplayHeight/2-50)+(curJoyDisplayHeight+100))
    {
      joystickActive = true;
      // draw the segment that connects to the mouse
      joystickMousePos(joyDisplayCenterX, joyDisplayCenterY, curJoyAngle);
      
      //robotMove = true;
      activePath = true;
      joystickUpdater();
    }
    else
    {
      joystickActive = false;
      motorValLeft = 0;
      motorValRight = 0;
      activePath = false;
      
      //robotMove = false;
    }

}

/********************************************************
 
 ROBOT UPDATER
 
 ********************************************************/

void joystickUpdater()
{

  dx = mouseX - joyDisplayCenterX;
  dy = mouseY - joyDisplayCenterY;

  curJoyAngle = atan2(dy, dx);
  curJoyRange = constrain(dist(mouseX, mouseY, joyDisplayCenterX, joyDisplayCenterY), 0, joyOutputRange-5);


  joyHorizontalText = (joyOutputRange*(cos(curJoyAngle) * curJoyRange)/ maxJoyRange);
  joyVerticalText = (joyOutputRange*(-(sin(curJoyAngle) * curJoyRange)/maxJoyRange));

  // radians

  float radHoriz;
  float radVert;

  radHoriz = radians(joyHorizontalText);
  radVert = radians(joyVerticalText);

  // gXLeft & gYLeft

    gXLeft = map(joyHorizontalText, -90, 90, -1.0, 1.0);
  gYLeft = map(joyVerticalText, -90, 90, -1.0, 1.0);

  gXRight = -gXLeft;
  gYRight = gYLeft;

  rectsLeft();
  rectsRight();
}

/*********************************

  JOYSTICK DRAW ELEMENTS

**********************************/
void joystickMainDraw()
{
  joystickDraw();
  joyStickDrawEllipse();
  joystickDrawSegments();
}


void joystickDraw()
{
  rectMode(CORNER);
  noFill();
  stroke(255, 100);
  rect(joyDisplayCenterX-curJoyDisplayWidth/2-50, joyDisplayCenterY-curJoyDisplayHeight/2-50, curJoyDisplayWidth+100, curJoyDisplayHeight+100);
}

// draw the joystick circle + segments

void joyStickDrawEllipse()
{
  fill(1, 71, 116, 100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight, curJoyDisplayWidth);
  stroke(0,100);
}


void joystickDrawSegments()
{
  strokeWeight(1);
  stroke(255,100);
  pushMatrix();
  translate(joyDisplayCenterX, joyDisplayCenterY);
  for(int i=0; i<8; i++)
  {
    rotate(PI/4);
    line(0, 0, 100, 0);
  }
  
  noStroke();
  fill(color3, 100);
  ellipse(0, 0, 20, 20);

  popMatrix();
}

/*********************************

  ARCS

**********************************/

void arcs()
{
  noFill();
  //stroke(100, 200, 50, 150);
  arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, 0, PI/2);
  arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, PI/2, PI);
  arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, PI, TWO_PI-PI/2);
  arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, TWO_PI-PI/2, TWO_PI);
}

/*********************************

  JOYSTICK MOUSE POSITION

**********************************/
 
void joystickMousePos(float x, float y, float a)
{
  pushMatrix();
  translate(x, y);
  rotate(a);
  if (curJoyRange > maxJoyRange)
    curJoyRange = maxJoyRange;
  stroke(255, 100);
  strokeWeight(4);
  line(0, 0, curJoyRange, 0);
  popMatrix();
  
  noStroke();
  fill(color3);
  /*
  text("curJoyAngle :"+curJoyAngle, 50, 285);
  text("curJoyRange: "+curJoyRange, 50, 300);
  text("maxJoyRange: "+maxJoyRange, 50, 315);
  text("a: "+a, 50, 330);
  */
}



/*********************************

  JOYSTICK CONDITIONS
  
  joystick conditions are used to check where the mouse is related to the joystick area 

**********************************/


// circle divided in 8 arcs

void joystickConditions3()
{
  noStroke();
  fill(255, 0, 0);
  if (curJoyAngle >= 0.0 && curJoyAngle <= PI/4){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, 0, PI/4);
    rectConditionsParser("condition1", "interp", "X");
  }
  if (curJoyAngle >= PI/4 && curJoyAngle <= PI/2){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, PI/4, PI/2);
    rectConditionsParser("condition2", "interp", "Y");
  }
  if (curJoyAngle >= PI/2 && curJoyAngle <= PI-PI/4){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, PI/2, PI-PI/4);
    rectConditionsParser("condition3", "Y", "interp");
  }
  if (curJoyAngle >= PI-PI/4 && curJoyAngle <= PI){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, PI-PI/4, PI);
    rectConditionsParser("condition4", "X", "interp");
  }
  if (curJoyAngle >= -PI && curJoyAngle <= -PI+PI/4){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, -PI, -PI+PI/4);
    rectConditionsParser("condition5", "interp", "X");
  }
  if (curJoyAngle >= -PI+PI/4 && curJoyAngle <= -PI/2){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, -PI+PI/4, -PI/2);
    rectConditionsParser("condition6", "interp", "Y");
  }
  if (curJoyAngle >= -PI/2 && curJoyAngle <= -PI/2+PI/4){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, -PI/2, -PI/2+PI/4);
    rectConditionsParser("condition7", "Y", "interp");
  }
  if (curJoyAngle >= -PI/2+PI/4 && curJoyAngle <= 0.0){
    if (drawRectsActive)
      arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+45, curJoyDisplayWidth+45, -PI/2+PI/4, 0.0);
    rectConditionsParser("condition8", "X", "interp");
  }
}

// this conditions are not used


/*

// circle divided in 4 arcs 

void joystickConditions1()
{
  noStroke();
  fill(200);
  if (curJoyAngle >= 0.0 && curJoyAngle <= PI/2){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, 0, PI/2);
  }
  if (curJoyAngle >= PI/2 && curJoyAngle <= PI){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, PI/2, PI);
  }
  if (curJoyAngle >= -PI && curJoyAngle <= -PI/2){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, PI, TWO_PI-PI/2);
  }
  if (curJoyAngle >= -PI/2 && curJoyAngle <= 0.0){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+15, curJoyDisplayWidth+15, TWO_PI-PI/2, TWO_PI);
  }
}

// circle divided in 4 arcs 

void joystickConditions2()
{
  noStroke();
  fill(255);
  if (curJoyAngle >= -PI/2+PI/4 && curJoyAngle <= PI/4){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+35, curJoyDisplayWidth+35, -PI/2+PI/4, PI/4);
  }
  if (curJoyAngle >= PI/4 && curJoyAngle <= PI-PI/4){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+35, curJoyDisplayWidth+35, PI/4, PI-PI/4);
  }
  if (curJoyAngle >= PI-PI/4 && curJoyAngle <= PI || curJoyAngle >= -PI && curJoyAngle <= -PI+PI/4){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+35, curJoyDisplayWidth+35, PI-PI/4, PI+PI/4);
  }
  if (curJoyAngle >= -PI+PI/4 && curJoyAngle <=  -PI/2+PI/4){
    arc(joyDisplayCenterX, joyDisplayCenterY, curJoyDisplayHeight+35, curJoyDisplayWidth+35, -PI+PI/4, -PI/2+PI/4);
    
  }
}

*/
