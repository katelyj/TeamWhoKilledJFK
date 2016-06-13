/*=============================================
  class Character -- The superclass for characters!
  Subclasses: Ghost, Pacman
  =============================================*/

abstract class Character {
  
  color col;
  int speed;
  int radius;
  int directionX;
  int directionY;
  int xpos;
  int ypos;
  
  Character() {
      col = color(0,0,0);
      speed = 2;
      radius = 30;
      directionX = 1;
      directionY = 0;
      xpos = 0;
      ypos = 0;
  }
  
  abstract void move();
  
  void setColor(color c) {
      col = c;   
  }
  
  void setSpeed(int s) {
    speed = s;
  }
  
  int getSpeed() {
    return speed;
  }
  
  int getX() {
    return xpos;
  }
  
  int getY() {
    return ypos;
  }
  
  void setX(int x) {
    xpos = x;
  }
  
  void setY(int y) {
    ypos = y;
  }
  
  void draw() {
    stroke(col);
    fill(col);
    ellipse(xpos,ypos,radius,radius);
  }
  
}