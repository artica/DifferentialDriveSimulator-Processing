class Ponto
{
  float x, y;
  int id;
  int maxCounter = 20000;
  int counter = 0;
  
  Ponto(int _id, float _x, float _y)
  {
    id = _id;
    x = _x;
    y = _y;
  }
  
  void display()
  {
    strokeWeight(3);
    pushMatrix();
    translate(0, 0, -20);
    point(x, y);
    popMatrix();
  }
  
  boolean finished()
  {
    boolean kill = false;
    if (counter < maxCounter)
    {
      counter++;
    }
    else
    {
      kill = true;
    }
    return kill;  
  }
  
}
