abstract class Character {
  
  final static int DEAD = 0;
  final static int ALIVE = 1; 
  
  int col;
  int speed;
  int state;
  int directionX;
  int directionY;
  int xpos;
  int ypos;
  
  Character() {
      state = ALIVE;
      col = 1; //FIGURE THIS OUT LATER
      speed = 1; //DITTO
      directionX = 1;
      directionY = 0;
  }
  
  abstract void move();
  
  boolean isDead() {
     return state == DEAD; 
  }
  
  void setColor(int c) {
      col = c;   
  }
 
  void changeState(int e) {
     state = e;
  }
  
}