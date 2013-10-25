/*********************************

  RECTS CONDITIONS PARSER

**********************************/

void rectConditionsParser(String a, String b, String c)
{
  condition = a;

  fill(255);
  
  if (displayConditionsRectsActive)
    text(a+"   :   "+b+"   :   "+c, 45, 260);
  
  if (b=="X")
    activeXLeft = true;
  else 
    activeXLeft = false;
  
  if (b=="Y")
    activeYLeft = true;
  else 
    activeYLeft = false;

  if (b=="interp")
    activeInterpLeft = true;
  else 
    activeInterpLeft = false;
    
    
    
  if (c=="X")
    activeXRight = true;
  else 
    activeXRight = false;
  
  if (c=="Y")
    activeYRight = true;
  else 
    activeYRight = false;

  if (c=="interp")
    activeInterpRight = true;
  else 
    activeInterpRight = false;  
    
}

/*********************************

  ONE RECT

**********************************/

int oneRectLeftX = 350;
int oneRectRightY = 450;
int oneRectY = 100;

int rectsLeftX = 550;
int rectsRightX = 700;


void oneRect(float valLeft, float valRight)
{
  
  rectMode(CORNER);
  
  strokeWeight(1);
  stroke(color3);
  
  // left
  
  pushMatrix();
  translate(oneRectLeftX, oneRectY);
  
  fill(color3);
  
  rect(0, 0, 25, valLeft);
  text(valLeft/50, -10, -55);
  
  noFill();
  rect(-25, -50, 75, 100);
  line(-25, 0, 50, 0);
  
  text("motor left", -10, 65);
  popMatrix();
  
  // right
  
  pushMatrix();
  translate(oneRectRightY, oneRectY);
  
  fill(color3);
  
  rect(0, 0, 25, valRight);
  text(valRight/50, -10, -55);
  
  noFill();
  rect(-25, -50, 75, 100);
  line(-25, 0, 50, 0);
  
  text("motor right", -10, 65);
  popMatrix();
}

/*********************************

  RECT LEFT

**********************************/

void rectsLeft()
{
  
  if (activeYLeft)
    motorValLeft = gYLeft*-50;
  
  if (activeXLeft)
    motorValLeft = gXLeft*-50;
  
  if (activeInterpLeft)
    motorValLeft = (gXLeft*-50)+(gYLeft*-50);  
    
}

void drawRectLeft()
{
  rectMode(CORNER);
  
  // RECT Y AXLE
  strokeWeight(1);
  
  pushMatrix();
  translate(rectsLeftX, 100);
  
  if (activeYLeft)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValLeft = gYLeft*-50;
  }
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, gYLeft*-50);
  text("Y: "+gYLeft*-50, 40, -20);
  
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
  
  
  // RECT X AXLE
  pushMatrix();
  translate(rectsLeftX, 225);
  
  if (activeXLeft)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValLeft = gXLeft*-50;
  }
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, gXLeft*-50);
  text("X: "+gXLeft*-50, 40, -20);
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
  
    //RECT INTERP
  
  pushMatrix();
  translate(rectsLeftX, 350);
  
  if (activeInterpLeft)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValLeft = (gXLeft*-50)+(gYLeft*-50);    
  }  
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, ((gXLeft*-50)+(gYLeft*-50)));
  text("interp: "+((gXLeft*-50)+(gYLeft*-50)), 40, -20);
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
  
}

/*********************************

  RECT RIGHT

**********************************/

void rectsRight()
{
  
  if (activeYRight)
    motorValRight = gYRight*-50;
  
  if (activeXRight)
    motorValRight = gXRight*-50;
  
  if (activeInterpRight)
    motorValRight = (gXRight*-50)+(gYRight*-50);

}

void drawRectRight()
{
  
  rectMode(CORNER);
  
  // RECT Y AXLE
  strokeWeight(1);
  
  pushMatrix();
  translate(rectsRightX, 100);
  
  if (activeYRight)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValRight = gYRight*-50;
  }
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, gYRight*-50);
  text("Y: "+gYRight*-50, 40, -20);
  
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
  
  
  // RECT X AXLE
  pushMatrix();
  translate(rectsRightX, 225);
  
  if (activeXRight)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValRight = gXRight*-50;
  }
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, gXRight*-50);
  text("X: "+gXRight*-50, 40, -20);
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
  
  
  //RECT INTERP
  
  pushMatrix();
  translate(rectsRightX, 350);
  
  if (activeInterpRight)
  {
    fill(colorActive);
    stroke(colorActive);
    //motorValRight = (gXRight*-50)+(gYRight*-50);
  }  
  else
  {
    fill(color3);
    stroke(color3);
  }
  
  rect(0, 0, 25, ((gXRight*-50)+(gYRight*-50)));
  text("interp: "+((gXRight*-50)+(gYRight*-50)), 40, -20);
  noFill();
  rect(-25, -50, 125, 100);
  line(-25, 0, 100, 0);
  popMatrix();
}
