class Ghost extends Character {
 
  int startx;
  int starty;
  int targetx;
  int targety;
  
  
  Ghost(int c) {
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
      else {
        if(targetx >= xpos){
           //if(up != wall){...}
           //else if(... !wall){}
        else if{
           //if(up != wall){...}
           //else if(... !wall){}
        }
      }
      //if ( (x == startx) && 
  }
  
  int[] shortestmove(){
     //helper find all paths
     //return x/y cord to move
  }
  
  void target(int x, int y) {
      targetx = x;
      targety = y;
  }
}