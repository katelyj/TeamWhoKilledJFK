/*=============================================
  class MapTile -- The tiles of the map!
  subclasses: Dotted
  =============================================*/
  
class MapTile {
  
  int type;
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
    else { //path (3-6)
      col = color(0);
      if ( hasDot() ) {
        if ( type == 3 ) { dot = new RegDot(x,y); }
        else { dot = new GlowyDot(x,y); }
      }
    }
  }
  
  boolean isPath() {
    return type >= 3;
  }
  
  boolean hasDot() {
    return type == 3 || type == 4;
  }
  
  Dot getDot() {
    return dot;
  }
  
  void draw() {
    stroke(col);
    fill(col);
    rect(xpos,ypos,30,30);
    if (hasDot()) { dot.draw(); }
  }
  
}