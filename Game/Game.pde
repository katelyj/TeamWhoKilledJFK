/* Welcome to: PACMAN 2.0!
Team Who Killed JFKate -- FINAL PROJECT! */

/*=============================================
  class Game -- The main class!
  Required classes: Map, MapTile, Character, Ghost, Pacman, Dot, Fruit, GlowyDot, RegDot, Stack, ALStack
  =============================================*/

Pacman pac = new Pacman();

void setup() {
    size(600,600);
    background(0);
  }
  
  void draw() { //testing for now
    clear();
    MapTile m = new MapTile(1,50,50);
    MapTile o = new MapTile(2,100,100);
    m.draw();
    o.draw();
    pac.draw();
    pac.move();
  }
  
  void keyPressed() {
    
    if (key == CODED ) {
      
      if (keyCode == LEFT) { //move down the x axis
        pac.setDirectionX(-1);
        pac.setDirectionY(0);
      }
      else if (keyCode == RIGHT) { //move up the x axis
        pac.setDirectionX(1);
        pac.setDirectionY(0);
      }
      else if (keyCode == UP) { //move down the y axis
        pac.setDirectionX(0);
        pac.setDirectionY(-1);
      }
      else if (keyCode == DOWN) { //move up the y axis
        pac.setDirectionX(0);
        pac.setDirectionY(1);
      }
      
    }
    
  }