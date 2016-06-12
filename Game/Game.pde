/* Welcome to: PACMAN 2.0!
Team Who Killed JFKate -- FINAL PROJECT! */

/*=============================================
  class Game -- The main class!
  Required classes: Map, MapTile, Character, Ghost, Pacman, Dot, Fruit, GlowyDot, RegDot, Stack, ALStack
  =============================================*/

int gameState = START;
Pacman pac = new Pacman();
Ghost a = new Ghost(color(0,255,255), pac.getMap().retMap(), pac);
Ghost b = new Ghost(color(255,192,203), pac.getMap().retMap(), pac);
Ghost c = new Ghost(color(255,0,0), pac.getMap().retMap(), pac);

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
    a.move();
    b.move();
    c.move();
    win();
    die();
  }
  
  void win() {
    if ( pac.getMap().getDotCount() == 0 ) {
      //WAIT 3 SECONDS -- HOW???
      levelUp();
    }
  }
  
  void levelUp() {
    
    pac.getMap().nextMap();
    pac.setSpeed(pac.getSpeed()+1);
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
      //WAIT 3 SECONDS -- HOW???
      
      if ( pac.getLives() <= 0 ) {
        gameState = GAMEOVER;
      }
      else {
        waitScreen();
      }
      
    }
    
  }
  
  boolean ghost() {
    //filler until implemented -- if pacman touching ghost
    return false;
  }
  
  void gameOver() {
    pac.getMap().draw();
    textSize(100);
    fill(255);
    text("GAMEOVER!",25,315);
    textSize(50);
    text("Final Score: " + pac.getPoints(),130,380);
  }
  
  void waitScreen() {
    pac.setX(pac.getMap().getStart().getX());
    pac.setY(pac.getMap().getStart().getY());
    pac.draw();
    info();
    //WAIT 3 SECONDS -- HOW???
    gameState = PLAYING;
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