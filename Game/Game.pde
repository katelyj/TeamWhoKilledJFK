/* Welcome to: PACMAN 2.0!
Team Who Killed JFKate -- FINAL PROJECT! */

/*=============================================
  class Game -- The main class!
  Required classes: Map, MapTile, Character, Ghost, Pacman, Dot, Fruit, GlowyDot, RegDot, Stack, ALStack
  =============================================*/

Pacman pac = new Pacman();
int gameState = PLAYING;

final static int START = 0;
final static int PLAYING = 1;
final static int GAMEOVER = 2;

void setup() {
    size(630,630);
    background(0);
  }
  
  void draw() {
    
    if ( gameState == START ) {
      startGame();
    }
  
    else if ( gameState == PLAYING ) {
      play();
    }
    
    else {
      gameOver();
    }
    
  }
  
  void startGame() {
    //options: start game, view highscores, etc
    //if start game:
    waitScreen();
  }
  
  void play() {
    clear();
    pac.draw();
    info();
    pac.move();
    win();
    die();
  }
  
  void win() {
    if ( pac.getMap().getDotCount() == 0 ) {
      levelUp();
    }
  }
  
  void levelUp() {
    
    pac.getMap().nextMap();
    pac.setX(pac.getMap().getStart().getX());
    pac.setY(pac.getMap().getStart().getY());
    
    if ( pac.getMap().getMapLevel() > 3 ) {
      gameState = GAMEOVER;
    }
    else {
      waitScreen();
    }
    
  }
  
  void die() {
    if ( ghost() ) {
      pac.changeState(0);
      pac.setLives(pac.getLives()-1);
      if ( pac.getLives() <= 0 ) {
        gameState = GAMEOVER;
      }
      else {
        restartLevel();
      }
    }
  }
  
  boolean ghost() {
    //filler until implemented -- if pacman touching ghost
    return false;
  }
  
  void restartLevel() {
    //pacman just died, so restart the level
    waitScreen();
  }
  
  void gameOver() {
    //what happens at the end of the game?
  }
  
  void waitScreen() {
    //about to start something new...
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
  
  void info() {
    
    //points
    textSize(25);
    fill(255);
    text("Points: " + pac.getPoints(),10,630);
    
    //lives
    fill(255,204,0);
    int n = 0;
    int x = 0;
    while ( n < pac.getLives() ) {
      ellipse(200+x,620,15,15);
      x += 20;
      n += 1;
    }
    
    //level
    textSize(25);
    fill(255);
    text("Level " + pac.getMap().getMapLevel(),300,630);
    
  }