/*=============================================
  class Fruit -- A subclass of Dot!
  =============================================*/
  
class Fruit extends Dot {
  
  int type;
  //TYPES: cherry = 100, strawberry = 300
  //orange = 500, apple = 700, melon = 1000
  color stemCol;
  
  Fruit(int t, MapTile spawn) {
    super(t,spawn.getX(),spawn.getY());
    type = t; //type matches amount of points
    setColor();
    stemCol = color(0,200,0);
    radius = 20;
  }
  
  void setColor() {
    
    if ( type == 100 ) { //cherry
      col = color(150,0,0);
    }
    
    else if ( type == 300 ) { //strawberry
      col = color(200,0,100);
    }
    
    else if ( type == 500 ) { //orange
      col = color(250,175,0);
    }
    
    else if ( type == 700 ) { //apple
      col = color(200,0,0);
    }
    
    else { //melon
      col = color(0,200,0);
    }
    
  }
  
  void draw() {
    
    if ( type == 100 ) { //cherry
      stroke(stemCol);
      triangle(xpos+8,ypos+10,xpos+12,ypos,xpos+16,ypos+10);
      stroke(col);
      fill(col);
      ellipse(xpos+8,ypos+14,radius/2,radius/2);
      ellipse(xpos+16,ypos+14,radius/2,radius/2);
    }
    
    else if ( type == 300 ) { //strawberry
      stroke(stemCol);
      fill(stemCol);
      ellipse(xpos+14,ypos+7,8,8);
      stroke(col);
      fill(col);
      triangle(xpos+8,ypos+7,xpos+14,ypos+20,xpos+20,ypos+7);
    }
    
    else if ( type == 500  || type == 700 ) { //orange or apple
      stroke(col);
      fill(col);
      ellipse(xpos+15,ypos+15,radius,radius);
      stroke(stemCol);
      fill(stemCol);
      ellipse(xpos+15,ypos+10,8,8);
    }
    
    else { //melon
      stroke(col);
      fill(col);
      ellipse(xpos+15,ypos+15,radius,radius);
      stroke(80,50,10);
      fill(80,50,10);
      ellipse(xpos+15,ypos+10,8,8);
    }
  
  }

}