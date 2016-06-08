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
  
  void move() {/*
    
    if (isDead()) {
      // target(startx,starty);
    }
    
      else { //use wall() method for this?
        if( targetx >= xpos ) {
           //if(ypos-1 != wall){...}
           //else if(... !wall){}
        }
        else {
           //if(ypos-1 != wall){...}
           //else if(... !wall){}
        }
      }
      //if ( (x == startx) && */
  }
  
  void wall() {
  }
  
  
  void setMove(MapTile[][] a) {
     //helper find all paths
     //return x/y cord to move

     if (targetx < xpos) {
      if (xpos > 0 && ! a[xpos-1][ypos].isWall()) {
        xpos--; //left
      }
      else {
       if (targety < ypos) {
        if (ypos > 0 && ! a[xpos][ypos-1].isWall()) {
         ypos--; //up
        }
        else {
          if (xpos < a[0].length && ! a[xpos+1][ypos].isWall()) {
            xpos++; //right
          }
          else {
           ypos++; //down
          }
        }
       }
       else{
         if (ypos < a.length && ! a[xpos][ypos+1].isWall()) {
         ypos++; //down
        }
        else {
          if (xpos < a[0].length && ! a[xpos+1][ypos].isWall()) {
            xpos++; //right
          }
          else {
           ypos--; //up
          }
        }
      }
     }
     else {
       if (xpos < a[0].length && ! a[xpos+1][ypos].isWall()) {
            xpos++; //right
          }
      else {
       if (targety < ypos) {
        if (ypos > 0 && ! a[xpos][ypos-1].isWall()) {
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
     
  }/**/
  
  
  void target(int x, int y) {
      targetx = x;
      targety = y;
  }
  
}