/*=============================================
  class Pacman -- A subclass of Character!
  =============================================*/

class Pacman extends Character {
  
  Map m;
  int points;
  int lives;
  
  Pacman() {
    super();
    m = new Map();
    points = 0;
    lives = 3;
    col = color(255,204,0);
    xpos = m.getStart().getX();
    ypos = m.getStart().getY();
  }
  
  void move() {
    
    xpos = xpos+speed*directionX;
    ypos = ypos+speed*directionY;
    
    warp();
    wall();
    die();
    
    if ( m.getTile(xpos,ypos).hasDot() ) {
      if ( ! m.getTile(xpos,ypos).getDot().isEaten() ) {
        points += m.getTile(xpos,ypos).getDot().getPoints();
        m.getTile(xpos,ypos).getDot().eaten();
        m.setDotCount(m.getDotCount()-1);
      }
    }
    
    if ( points == 10000 ) {
      lives += 1;
    }
    
  }
  
  void warp() {
    if ( m.getTile(xpos,ypos).isWarp() ) {
      if ( m.getTile(xpos,ypos).equals(m.getWarp1()) ) {
        xpos = m.getWarp2().getX()-30; //so pacman won't get stuck in a loop
        ypos = m.getWarp2().getY();
      }
      else {
        xpos = m.getWarp1().getX()+30; //so pacman won't get stuck in a loop
        ypos = m.getWarp2().getY();
      }
    }
  }
  
  void wall() {
    
    if ( xpos >= width ) {
      xpos = xpos-speed*directionX;
    }
    else if ( xpos <= 0 ) {
      xpos = xpos-speed*directionX;
    }
    else if ( ypos >= height ) {
      ypos = ypos-speed*directionY;
    }
    else if ( ypos <= 0 ) {
      ypos = ypos-speed*directionY;
    }
    else {
      if ( ! m.getTile(xpos,ypos).isPath() ) {
        xpos = xpos-speed*directionX;
        ypos = ypos-speed*directionY;
      }
    }
    
  }
  
  void setDirectionX(int i) {
    directionX = i;
  }
  
  void setDirectionY(int i) {
    directionY = i;
  }
  
  Map getMap() {
    return m;
  }
  
  int getPoints() {
    return points;
  }
  
  int getLives() {
    return lives;
  }
  
  void setLives(int l) {
    lives = l;
  }
  
  void draw() {
    m.draw();
    super.draw();
  }
  
}