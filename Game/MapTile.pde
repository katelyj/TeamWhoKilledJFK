/*=============================================
  class MapTile -- The tiles of the map!
  =============================================*/
  
class MapTile {
  
  boolean isWall;
  boolean isVoid;
  boolean hasDot;
  Dot dot;
  color col;
  int xpos;
  int ypos;
  
  MapTile(boolean w, boolean v, int x, int y) {
    isWall = w;
    isVoid = v;
    if (isWall()) { col = color(50,50,200); }
    else if (isVoid() ) { col = color(100,100,200); }
    else { col = color(0); }
    xpos = x;
    ypos = y;
  }
  
  void setDot(Dot d) {
    dot = d;
    hasDot = true;
  }
  
  void remDot() {
    dot = null;
    hasDot = false;
  }
  
  Dot getDot() {
    return dot;
  }
  
  boolean hasDot() {
    return hasDot;
  }
  
  boolean isWall() {
    return isWall;
  }
  
  boolean isVoid() {
    return isVoid;
  }
  
  void draw() {
    stroke(col);
    fill(col);
    rect(xpos,ypos,20,20);
  }
  
}