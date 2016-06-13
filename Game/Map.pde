/*=============================================
  class Map -- The map of the game!
  =============================================*/
  
class Map {

  MapTile start;
  MapTile warp1;
  MapTile warp2;
  MapTile fruitSpawn;
  
  ALStack<Fruit> fruit;
  
  int mapLevel;
  int dotCount;
  
  MapTile[][] map = new MapTile[21][21];
  int[][] map1 = {{1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
                  {1,2,3,3,3,3,3,3,3,3,2,3,3,3,3,3,3,3,3,2,1},
                  {1,2,4,2,2,3,2,2,2,3,2,3,2,2,2,3,2,2,4,2,1},
                  {1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1},
                  {1,2,3,2,2,3,2,3,2,2,2,2,2,3,2,3,2,2,3,2,1},
                  {1,2,3,3,3,3,2,3,3,3,2,3,3,3,2,3,3,3,3,2,1},
                  {1,2,2,2,2,3,2,2,2,5,2,5,2,2,2,3,2,2,2,2,1},
                  {1,1,1,1,2,3,2,5,5,5,5,5,5,5,2,3,2,1,1,1,1},
                  {2,2,2,2,2,3,2,5,0,0,5,0,0,5,2,3,2,2,2,2,2},
                  {7,5,5,5,5,4,5,5,0,5,5,5,0,8,5,4,5,5,5,5,7},
                  {2,2,2,2,2,3,2,5,0,0,0,0,0,5,2,3,2,2,2,2,2},
                  {1,1,1,1,2,3,2,5,5,5,5,5,5,5,2,3,2,1,1,1,1},
                  {1,2,2,2,2,3,2,5,2,2,2,2,2,5,2,3,2,2,2,2,1},
                  {1,2,3,3,3,3,3,3,3,3,2,3,3,3,3,3,3,3,3,2,1},
                  {1,2,3,2,2,3,2,2,2,3,2,3,2,2,2,3,2,2,3,2,1},
                  {1,2,4,3,2,3,3,3,3,3,6,3,3,3,3,3,2,3,4,2,1},
                  {1,2,2,3,2,3,2,3,2,2,2,2,2,3,2,3,2,3,2,2,1},
                  {1,2,3,3,3,3,2,3,3,3,2,3,3,3,2,3,3,3,3,2,1},
                  {1,2,3,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,3,2,1},
                  {1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1},
                  {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1}};
   int[][] map2 = map1; //if we had time, we would make more maps
   int[][] map3 = map1; //but for now, with our limited time, we're only using one
  
  Map() {
    mapLevel = 1;
    dotCount = 0;
    setMap();
  }
  
  void setMap() {
    if ( mapLevel == 1 ) {
      setMap(map1);
    }
    else if ( mapLevel == 2 ) {
      setMap(map2);
    }
    else {
      setMap(map3);
    }
  }
  
  void setMap(int[][] m) {
    
    start = null;
    warp1 = null;
    warp2 = null;
    fruitSpawn = null;
    
    for ( int x = 0 ; x < m.length ; x++ ) {
      
      for ( int y = 0 ; y < m[x].length ; y++ ) {
        
        map[x][y] = new MapTile(m[x][y],y*30,x*30);
        
        if ( m[x][y] == 3 || m[x][y] == 4 ) { //dotted
          dotCount += 1;
        }
        
        else if ( m[x][y] == 6 ) { //spawn space
          start = map[x][y];
        }
        
        else if ( m[x][y] == 7 ) { //warp space
          if ( warp1 == null ) {
            warp1 = map[x][y];
          }
          else {
            warp2 = map[x][y];
          }
        }
        
        else if ( m[x][y] == 8 ) { //fruit spawn
          fruitSpawn = map[x][y];
          map[x][y].setFruited(false);
          fruits();
        }
        
      }
      
    }
  }
  
  void fruits() {
    
    fruit = new ALStack<Fruit>();
    
    if ( mapLevel == 1) {
      fruit.push(new Fruit(300,fruitSpawn));
      fruit.push(new Fruit(100,fruitSpawn));
    }
    else if ( mapLevel == 2 ) {
      fruit.push(new Fruit(700,fruitSpawn));
      fruit.push(new Fruit(500,fruitSpawn));
    }
    else {
      fruit.push(new Fruit(1300,fruitSpawn));
      fruit.push(new Fruit(1000,fruitSpawn));
    }
    
  }
  
  void nextMap() {
    mapLevel += 1;
    setMap();
  }
  
  boolean hasGhost() { //IMPLEMENT THIS
    return false;
  }
  
  void setDotCount(int d) {
    dotCount = d;
  }
  
  int getDotCount() {
    return dotCount;
  }
  
  MapTile getTile(int x, int y) {
    return map[y/30][x/30];
  }
  
  MapTile getStart() {
    return start;
  }
  
  MapTile getWarp1() {
    return warp1;
  }
  
  MapTile getWarp2() {
    return warp2;
  }
  
  MapTile getFruitSpawn() {
    return fruitSpawn;
  }
  
  ALStack<Fruit> getFruit() {
    return fruit;
  }
  
  int getMapLevel() {
    return mapLevel;
  }
  
  void draw() {
    for ( int x = 0 ; x < map.length ; x++ ) {
      for ( int y = 0 ; y < map[x].length ; y++ ) {
        map[x][y].draw();
      }
    }
  }
  
}