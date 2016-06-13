/* Welcome to: PACMAN 2.0!
Team Who Killed JFKate -- FINAL PROJECT! */

/*=============================================
  class Game -- The main class!
  Required classes: Map, MapTile, Character, Ghost, Pacman, Dot, Fruit, GlowyDot, RegDot, Stack, ALStack
  =============================================*/

int gameState = START;
Pacman pac = new Pacman();
Ghost a = new Ghost(color(0,255,255), pac.getMap(), pac);
Ghost b = new Ghost(color(255,192,203), pac.getMap(), pac);
Ghost c = new Ghost(color(255,0,0), pac.getMap(), pac);

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
    
    pac.getMap().draw();
    textSize(50);
    fill(255);
    text("Welcome to",175,100);
    fill(255,204,0);
    textSize(100);
    text("PACMAN!",85,250);
    
    //start game instructions
    textSize(50);
    fill(255);
    text("Press ENTER to begin!",50,325);
    
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
      waitThreeSeconds();
      levelUp();
    }
  }
  
  void levelUp() {
    
    pac.getMap().nextMap();
    pac.setSpeed(pac.getSpeed()+1);
    a.setSpeed(a.getSpeed()+1);
    b.setSpeed(b.getSpeed()+1);
    c.setSpeed(c.getSpeed()+1);
    pac.setPointsL(0);
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
    
    if ( pac.col == color(255,204,0) && ghost() ) {
      pac.setLives(pac.getLives()-1);
      waitThreeSeconds();
      
      if ( pac.getLives() <= 0 ) {
        gameState = GAMEOVER;
      }
      else {
        waitScreen();
      }
      
    }
    
  }

 boolean ghost() {
    if(sqrt(sq(pac.getX() - a.getX())+sq(pac.getY() - a.getY()))<=30){
      return true;
    }
    else if(sqrt(sq(pac.getX() - b.getX())+sq(pac.getY() - b.getY()))<=30){
      return true;
    }
    else if(sqrt(sq(pac.getX() - c.getX())+sq(pac.getY() - c.getY()))<=30){
      return true;
    }
      return false;
 }
  
  void gameOver() {
    pac.getMap().draw();
    textSize(100);
    fill(255);
    text("GAMEOVER!",25,315);
    textSize(50);
    text("Final Score: " + pac.getPointsO(),130,380);
  }
  
  void waitScreen() {
    //everyone goes back to their original places
    pac.setX(pac.getMap().getStart().getX());
    pac.setY(pac.getMap().getStart().getY());
    a.setX(a.getStartX());
    a.setY(a.getStartY());
    b.setX(a.getStartX());
    b.setY(a.getStartY());
    c.setX(a.getStartX());
    c.setY(a.getStartY());
    
    pac.draw();
    info();
    waitThreeSeconds();
    gameState = PLAYING;
  }
  
  void waitThreeSeconds() {
    //how???
  }
  
  void keyPressed() {
    
    if (key == ENTER && gameState == START) {
      waitScreen();
    }
    
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
    text("Score: " + pac.getPointsO(),10,630);
    
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
    
    //fruits
    for ( Fruit f : pac.getEatenFruits() ) {
      f.draw();
    }
    
  }