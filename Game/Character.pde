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
  int directionX;
  int directionY;
  int xpos;
  int ypos;
  
  Character() {
      state = ALIVE;
      col = color(0,0,0); //FIGURE THIS OUT LATER
      speed = 1; //DITTO
      directionX = 1;
      directionY = 0;
  }
  
  abstract void move();
  
  abstract void wall();
  
  boolean isDead() {
     return state == DEAD; 
  }
  
  void setColor(color c) {
      col = c;   
  }
 
  void changeState(int e) {
     state = e;
  }
  
  void display() {
    stroke(col);
    fill(col);
    ellipse(xpos,ypos,20,20);
  }
  
}