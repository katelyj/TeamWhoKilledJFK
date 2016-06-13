/*=============================================
  class Ghost -- A subclass of Character!
  =============================================*/

class Ghost extends Character {
 
  final static int DEAD = 0;
  final static int ALIVE = 1; 
  
  int startx;
  int starty;
  int targetx;
  int targety;
  int state;
  boolean a;
  boolean b;
  boolean c;
  boolean d;
  int u;
  int v;
  int y;
  Pacman p;
  Map m;
  
  Ghost( color i, Map a, Pacman z ) {
    super();
    setColor(i);
    m = a;
    p = z;
    u = 0;
    v = 0;
    y = 300;
    if ( col == color(0,255,255) ) {
       startx = 345;
       xpos = 345;
       starty = 285;
       ypos = 285;
       speed = 1;
    }
    if ( col == color(255,192,203) ) {
       startx = 285;
       xpos = 285;
       starty = 285;
       ypos = 285;
       speed = 2;
    }
    if ( col == color(255,0,0) ) {
       startx = 315;
       xpos = 315;
       starty = 285;
       ypos = 285;
       speed = 2;
    }
    state = ALIVE;
  }
  
  void move() {
    if(state == DEAD){
      xpos = startx;
      ypos = starty;
      if(y == 0){
          draw();
          state = ALIVE;
          targetx = p.getX();
          targety = p.getY();
          y = 300;
      }
      else{
          y--;
      }
    }
    else if(xpos >= 270 && xpos <= 360 && ypos <= 300 && ypos > 230){
       target(315,225);
       setMove();
       draw();
    }
    else{
      target(p.getX(), p.getY());
      setMove();
      draw();
    } 
  }
  
  void setMove() { 
     //helper find all paths
     //return x/y cord to move
     a = m.getTile(xpos-speed,ypos).isPath();
     b = m.getTile(xpos,ypos-speed).isPath();
     c = m.getTile(xpos+speed,ypos).isPath();
     d = m.getTile(xpos,ypos+speed).isPath();
     
         if(abs(targetx - xpos) < 5){
            u = 2;
         }
         else if(targetx < xpos){
            u = 0;
         }
         else{
            u = 1;
         }
         
         if(abs(targety - ypos) < 5){
            v = 2;
         }
         else if(targety < ypos){
            v = 0;
         }
         else{
            v = 1;
         }
    if(u == 2){
           if(v == 0){
               if(b){  
                       ypos-=speed;
               }
               else{
                  if(a){
                       xpos-=speed;
                  }
                  else if(c){
                       xpos+=speed;
                  }
                  else{
                      ypos+=speed;
                  }
               }
           }
           else if(v == 1){
               if(d){
                       ypos+=speed;
               }
               else{
                  if(a){
                       xpos-=speed;
                  }
                  else if(c){
                       xpos+=speed;
                  }
                  else{
                      ypos-=speed;
                  }
               }
           }
           else{
             if(p.col == color(119,0,0)){
                 state = DEAD;
             }
           }
     }
     else if(v == 2){
           if(u == 0){
               if(a){
                       xpos-=speed;
               }
               else{
                  if(b){
                       ypos-=speed;
                  }
                  else if(d){
                       ypos+=speed;
                  }
                  else{
                      xpos+=speed;
                  }
               }
           }
           else{
               if(b){
                       xpos+=speed;
               }
               else{
                  if(b){
                       ypos-=speed;
                  }
                  else if(d){
                       ypos+=speed;
                  }
                  else{
                      xpos-=speed;
                  }
               }
           }
     }
           else if(u == 0){
               if(a){
                       xpos-=speed;
               }
               else{
                  if(v == 0 && b){
                       ypos-=speed;
                  }
                  else{
                    if(d){
                       ypos+=speed;
                    }
                    else{
                       xpos+=speed;
                    }
                  }
               }
           }
           else if(u == 1){
               if(c){
                       xpos+=speed;
               }
               else{
                  if(v == 0 && b){
                       ypos-=speed;
                  }
                  else if(d){
                       ypos+=speed;
                  }
                  else{
                      xpos-=speed;
                  }
               }
           }
   }
  
  void target(int x, int y) {
      targetx = x;
      targety = y;
  }
  
  void changeState(int e) {
     state = e;
  }
  
  int getState() {
    return state;
  }
  
  int getStartX() {
    return startx;
  }
  
  int getStartY() {
    return starty;
  }
  
  void draw() {
    super.draw();
    //the eyes
    stroke(0);
    fill(0);
    ellipse(xpos+5,ypos-5,5,5);
    ellipse(xpos-5,ypos-5,5,5);
  }
  
}