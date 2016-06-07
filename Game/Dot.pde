/*=============================================
  class Dot -- The superclass for dots!
  Subclasses: RegDot, GlowyDot, Fruit
  =============================================*/
  
abstract class Dot {
  
  int points;
  color col;
  int xpos;
  int ypos;
  
  Dot(int p) { //IMPLEMENT POS
    points = p;
    col = color(0,0,0);
  }
  
  void draw() {
    stroke(col);
    fill(col);
    ellipse(xpos,ypos,20,20); //MAKE SMALLER
  }
  
}