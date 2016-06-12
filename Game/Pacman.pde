/*=============================================
  class Pacman -- A subclass of Character!
  =============================================*/

class Pacman extends Character {
  
  Map m;
  int pointsL; //points per level
  int pointsO; //points overall
  int lives;
  
  Pacman() {
    super();
    m = new Map();
    pointsL = 0;
    pointsO = 0;
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
    eat();
    spawnFruit();
    
    //checking for extra life
    if ( pointsO == 10000 ) {
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
  
  void spawnFruit() {

    if ( ! m.getFruitSpawn().hasDot() ) {
      if ( pointsL > 500 ) {
    
        if ( pointsL > 1500 ) {
          if ( ! m.getFruit().isEmpty() ) {
            m.getFruitSpawn().setFruited(true);
            m.getFruitSpawn().setDot(m.getFruit().pop());
          }
        }
      
        else {
          if ( m.getFruit().getSize() > 1 ) {
            m.getFruitSpawn().setFruited(true);
            m.getFruitSpawn().setDot(m.getFruit().pop());
          }
        }
      
      }
    }
    
  }
  
  void eat() {
    
    if ( m.getTile(xpos,ypos).hasDot() ) {
      if ( ! m.getTile(xpos,ypos).getDot().isEaten() ) {
        
        pointsL += m.getTile(xpos,ypos).getDot().getPoints();
        pointsO += m.getTile(xpos,ypos).getDot().getPoints();
        m.getTile(xpos,ypos).getDot().eaten();
        
        if ( m.getTile(xpos,ypos).getType() == 8 ) { //fruit
          m.getTile(xpos,ypos).setFruited(false);
        }
        else { //nonfruit
          m.setDotCount(m.getDotCount()-1);
        }
        
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
  
  void setPointsL(int i) {
    pointsL = i;
  }
  
  int getPointsO() {
    return pointsO;
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