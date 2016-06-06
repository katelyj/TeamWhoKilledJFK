/*=============================================
  class Pacman -- A subclass of Character!
  =============================================*/

class Pacman extends Character {
  
  Pacman() {
    super();
    col = color(255,204,0); //what is yellow?
    xpos = 0; //figure out later
    ypos = 0; //ditto
  }
  
  void move() {
    xpos = xpos+speed*directionX;
    ypos = ypos+speed*directionY;
    wall();
  }
  
  void wall() {
    if ( xpos > width ) {
      xpos = xpos-speed*directionX;
    }
    else if ( xpos < 0 ) {
      xpos = xpos-speed*directionX;
    }
    else if ( ypos > height ) {
      ypos = ypos-speed*directionY;
    }
    else if ( ypos < 0 ) {
      ypos = ypos-speed*directionY;
    }
    else {
      return;
    }
  }
  
  void setDirectionX(int i) {
    directionX = i;
  }
  
  void setDirectionY(int i) {
    directionY = i;
  }
  
}