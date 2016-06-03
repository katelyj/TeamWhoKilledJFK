abstract class Character {
  
  final static int DEAD = 0;
  final static int ALIVE = 1; 
  
  int col;
  int speed;
  int state;
  
  Character() {
      state = ALIVE;
      col = 1; //FIGURE THIS OUT LATER
      speed = 1; //DITTO
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