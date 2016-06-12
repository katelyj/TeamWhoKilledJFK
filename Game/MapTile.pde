/*=============================================
  class MapTile -- The tiles of the map!
  subclasses: Dotted
  =============================================*/
  
class MapTile {
  
  int type; //TYPELIST: ghost spawn = 0, void = 1, wall = 2
            //dotted path = 3, glowy dotted path = 4, nondotted path = 5
            //pacman spawn = 6, warp space = 7, fruit spawn = 8
  color col;
  int xpos;
  int ypos;
  Dot dot;
  boolean fruited;
  
  MapTile(int t, int x, int y) {
    type = t;
    xpos = x;
    ypos = y;
    fruited = false;
    if ( type <= 1 ) { //void space
      col = color(100,100,200); 
    }
    else if ( type == 2 ) { //wall
      col = color(50,50,200); 
    }
    else if ( type == 7 ) { //warp space
      col = color(250,100,200);
    }
    else { //path (3-8, but not 7)
      col = color(0);
      
      if ( hasDot() ) {
        if ( type == 3 ) { dot = new RegDot(x+10,y+10); }
        else if ( type == 4 ) { dot = new GlowyDot(x+10,y+10); }
      }
      
    }
  }
  
  boolean isPath() {
    return type >= 3;
  }
  
  boolean isWarp() {
    return type == 7;
  }
  
  boolean hasDot() {
    if ( type == 8 ) {
      return fruited;
    }
    else {
      return type == 3 || type == 4;
    }
  }
  
  void setDot(Dot d) {
    dot = d;
  }
  
  Dot getDot() {
    return dot;
  }
  
  int getType() {
    return type;
  }
  
  int getX() {
    return xpos;
  }
  
  int getY() {
    return ypos;
  }
  
  void setFruited(boolean b) {
    fruited = b;
  }
  
  void draw() {
    stroke(col);
    fill(col);
    rect(xpos,ypos,30,30);
    if (hasDot()) { dot.draw(); }
  }
  
}