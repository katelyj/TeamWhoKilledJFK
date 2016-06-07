/*=============================================
  class MapTile -- The tiles of the map!
  =============================================*/
  
class MapTile {
  
  boolean isWall;
  boolean hasDot;
  Dot dot;
  color col;
  int xpos;
  int ypos;
  
  MapTile(boolean w, int x, int y) {
    isWall = w;
    if (isWall()) { col = color(48,109,206); }
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
  
  void draw() {
    stroke(col);
    fill(col);
    rect(xpos,ypos,20,20);
  }
  
}