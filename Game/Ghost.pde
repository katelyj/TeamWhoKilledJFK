/*=============================================
  class Ghost -- A subclass of Character!
  =============================================*/

class Ghost extends Character {
 
  int startx;
  int starty;
  int targetx;
  int targety;
  color col;
  Pacman p;
  MapTile[][] m;
  
  Ghost( color c, MapTile[][] a, Pacman z ) {
    super();
    setColor(c);
    m = a;
    col = c;
    p = z;
    if(c == color(0,255,255)){
       startx = 9;
       xpos = 9;
       starty = 9;
       ypos = 9;
    }
    if(c == color(255,192,203)){
       startx = 10;
       xpos = 10;
       starty = 9;
       ypos = 9;
    }
    if(c == color(255,0,0)){
       startx = 11;
       xpos = 11;
       starty = 9;
       ypos = 9;
    }
    state = ALIVE;
  }
  
  void draw(){
       stroke(col);
       fill(col);
       ellipse(xpos*30,ypos*30,30,30);
  }  
  
  void move() { 
    if(state == DEAD){
      targetx = startx;
      targety= starty;
      setMove(m);
      wall();
      if(startx == xpos && starty == ypos){
        this.changeState(ALIVE);
        targetx = p.getX();
        targety = p.getY();
      }
      draw();
    }
    else{
      targetx = p.getX();
      targety = p.getY();
      setMove(m);
      wall();
      draw();
    } 
  }
  
  
  
  void wall() { 
    
    if ( ! m[xpos][ypos].isPath() ) {
      xpos = xpos-speed*directionX;
      ypos = ypos-speed*directionY;
    }
    
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
  
  
  void setMove(MapTile[][] a) { 
     //helper find all paths
     //return x/y cord to move

     if (targetx < xpos) {
      if (xpos > 0 && a[xpos-1][ypos].isPath()) {
        xpos--; //left
      }
      else {
       if (targety < ypos) {
        if (ypos > 0 && a[xpos][ypos-1].isPath()) {
         ypos--; //up
        }
        else {
          if (xpos < a[0].length && a[xpos+1][ypos].isPath()) {
            xpos++; //right
          }
          else {
           ypos++; //down
          }
        }
       }
       else {
         if (ypos < a.length && a[xpos][ypos+1].isPath()) {
         ypos++; //down
        }
        else {
          if (xpos < a[0].length && a[xpos+1][ypos].isPath()) {
            xpos++; //right
          }
          else {
           ypos--; //up
          }
        }
      }
      }
      }
     else {
       if (xpos < a[0].length && a[xpos+1][ypos].isPath()) {
            xpos++; //right
          }
      else {
       if (targety < ypos) {
        if (ypos > 0 && a[xpos][ypos-1].isPath()) {
         ypos--; //up
        }
        else {
          if (xpos > 0 && a[xpos-1][ypos].isPath()) {
        xpos--; //left
         }
          else {
           ypos++; //down 
          }
        }
       }
      }
     }
  }
  
  
  void target(int x, int y) {
      targetx = x;
      targety = y;
  }
  
}