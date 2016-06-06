class Pacman extends Character {
  
  Pacman() {
    super();
    col = 1; //what is yellow?
    xpos = 0; //figure out later
    ypos = 0; //ditto
  }
  
  void keyPressed() {
    
    if (key == CODED ) {
      
      if (keyCode == LEFT) {
        directionX = -1;
        directionY = 0;
      }
      else if (keyCode == RIGHT) {
        directionX = 1;
        directionY = 0;
      }
      else if (keyCode == UP) { //move up the y axis
        directionX = 0;
        directionY = -1;
      }
      else if (keyCode == DOWN) { //move down the y axis
        directionX = 0;
        directionY = 1;
      }
      
    }
    
  }
  
  void move() {
  }
  
}