/*=============================================
  class Dot -- The superclass for dots!
  Subclasses: RegDot, GlowyDot, Fruit
  =============================================*/
  
abstract class Dot {
  
  int points;
  int radius;
  color col;
  boolean eaten;
  int xpos;
  int ypos;
  
  Dot(int p, int x, int y) {
    points = p;
    radius = 10;
    col = color(255);
    eaten = false;
    xpos = x;
    ypos = y;
  }
  
  void eaten() {
    eaten = true;
  }
  
  void notEaten() {
    eaten = false;
  }
  
  boolean isEaten() {
    return eaten;
  }
  
  int getPoints() {
    return points;
  }
  
  void draw() {
    if ( ! isEaten() ) {
      stroke(col);
      fill(col);
      ellipse(xpos,ypos,radius,radius);
    }
  }
  
}