/*=============================================
  class Character -- The superclass for characters!
  Subclasses: Ghost, Pacman
  =============================================*/

abstract class Character {
  
  final static int DEAD = 0;
  final static int ALIVE = 1; 
  
  color col;
  int speed;
  int state;
  int radius;
  int directionX;
  int directionY;
  int xpos;
  int ypos;
  
  Character() {
      state = ALIVE;
      col = color(0,0,0);
      speed = 2;
      radius = 30;
      directionX = 1;
      directionY = 0;
      xpos = 0;
      ypos = 0;
  }
  
  abstract void move();
  
  abstract void wall();
  
  void setColor(color c) {
      col = c;   
  }
 
  void changeState(int e) {
     state = e;
  }
  
  int getState() {
    return state;
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