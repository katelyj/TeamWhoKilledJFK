/*=============================================
  class Dot -- The superclass for dots!
  Subclasses: RegDot, GlowyDot, Fruit
  =============================================*/
  
abstract class Dot {
  
  int points;
  color col;
  boolean eaten;
  int xpos;
  int ypos;
  
  Dot(int p, int x, int y) {
    points = p;
    col = color(0,0,0);
    eaten = true;
    xpos = x;
    ypos = y;
  }
  
  boolean isEaten() {
    return eaten;
  }
  
  void draw() {
    if ( ! isEaten() ) {
      stroke(col);
      fill(col);
      ellipse(xpos,ypos,10,10);
    }
  }
  
}