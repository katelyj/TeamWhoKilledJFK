class Pacman extends Character {
  
  Pacman() {
    super();
    col = color(255,204,0); //what is yellow?
    xpos = 0; //figure out later
    ypos = 0; //ditto
  }
  
  void keyPressed() {
    
    if (key == CODED ) {
      
      if (keyCode == LEFT) { //move up the x axis
        directionX = 1;
        directionY = 0;
      }
      else if (keyCode == RIGHT) { //move down the x axis
        directionX = -1;
        directionY = 0;
      }
      else if (keyCode == UP) { //move up the y axis
        directionX = 0;
        directionY = -1; //"up" for processing is "down" for us
      }
      else if (keyCode == DOWN) { //move down the y axis
        directionX = 0;
        directionY = 1;
      }
      
    }
    
  }
  
  void move() {
    xpos = xpos+speed*directionX;
    ypos = ypos+speed*directionY;
  }
  
}