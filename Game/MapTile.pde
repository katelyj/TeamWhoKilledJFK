/*=============================================
  class MapTile -- The tiles of the map!
  subclasses: Dotted
  =============================================*/
  
class MapTile {
  
  int type; //TYPELIST: ghost spawn = 0, void = 1, wall = 2
            //dotted path = 3, glowy dotted path = 4, nondotted path = 5
            //pacman spawn = 6, warp space = 7
  color col;
  int xpos;
  int ypos;
  Dot dot;
  
  MapTile(int t, int x, int y) {
    type = t;
    xpos = x;
    ypos = y;
    if ( type <= 1 ) { //void space
      col = color(100,100,200); 
    }
    else if ( type == 2 ) { //wall
      col = color(50,50,200); 
    }
    else if ( type == 7 ) { //warp space
      col = color(250,100,200);
    }
    else { //path (3-6)
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
    return type == 3 || type == 4;
  }
  
  Dot getDot() {
    return dot;
  }
  
  int getX() {
    return xpos;
  }
  
  int getY() {
    return ypos;
  }
  
  void draw() {
    stroke(col);
    fill(col);
    rect(xpos,ypos,30,30);
    if (hasDot()) { dot.draw(); }
  }
  
}