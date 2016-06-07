/*=============================================
  class Ghost -- A subclass of Character!
  =============================================*/

class Ghost extends Character {
 
  int startx;
  int starty;
  int targetx;
  int targety;
  
  Ghost( color c ) {
    super();
    setColor(c);
    // startx = ? xpos=
    // starty = ? ypos=
    // set directionx & y
  }
  
  void move() {
    
    if (isDead()) {
      // target(startx,starty);
    }
    
      else { //use wall() method for this?
        if( targetx >= xpos ) {
           //if(up != wall){...}
           //else if(... !wall){}
        }
        else {
           //if(up != wall){...}
           //else if(... !wall){}
        }
      }
      //if ( (x == startx) && 
  }
  
  void wall() {
  }
  
  
  void setMove(MapTile[][] a) {
     //helper find all paths
     //return x/y cord to move
     int up; 
     int down;
     int left;
     int right;
     if (xpos > 0) {
      left = xpos - 1;  
     }
     if (xpos < a[0].length) {
      right = xpos + 1;  
     }
     if (ypos > 0) {
      up = ypos - 1;  
     }
     if (ypos > a.length) {
      down = ypos + 1;  
     }
     if (targetx < xpos) {
      if (xpos > 0 && ! a[left][ypos].isWall()) {
        xpos--; //left
      }
      else {
       if (targety < ypos) {
        if (ypos > 0 && ! a[xpos][up].isWall()) {
         ypos--; //up
        }
        else {
          if (xpos < a[0].length && ! a[right][ypos].isWall()) {
            xpos++; //right
          }
          else {
           ypos++; //down 
          }
        }
       }
      }
     }
     else {
       if (xpos < a[0].length && ! a[right][ypos].isWall()) {
            xpos++; //right
          }
      else {
       if (targety < ypos) {
        if (ypos > 0 && ! a[xpos][up].isWall()) {
         ypos--; //up
        }
        else {
          if (xpos > 0 && ! a[left][ypos].isWall()) {
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