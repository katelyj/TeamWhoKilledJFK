/*=============================================
  class Map -- The map of the game!
  =============================================*/
  
class Map {
  
  MapTile[][] map = new MapTile[21][21];
  MapTile start;
  MapTile warp1;
  MapTile warp2;
  int mapLevel;
  int dotCount;
  int[][] map1 = {{1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
                  {1,2,3,3,3,3,3,3,3,3,2,3,3,3,3,3,3,3,3,2,1},
                  {1,2,4,2,2,3,2,2,2,3,2,3,2,2,2,3,2,2,4,2,1},
                  {1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1},
                  {1,2,3,2,2,3,2,3,2,2,2,2,2,3,2,3,2,2,3,2,1},
                  {1,2,3,3,3,3,2,3,3,3,2,3,3,3,2,3,3,3,3,2,1},
                  {1,2,2,2,2,3,2,2,2,5,2,5,2,2,2,3,2,2,2,2,1},
                  {1,1,1,1,2,3,2,5,5,5,5,5,5,5,2,3,2,1,1,1,1},
                  {2,2,2,2,2,3,2,5,0,0,5,0,0,5,2,3,2,2,2,2,2},
                  {7,5,5,5,5,3,5,5,0,5,5,5,0,5,5,3,5,5,5,5,7},
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
    for ( int x = 0 ; x < m.length ; x++ ) {
      
      for ( int y = 0 ; y < m[x].length ; y++ ) {
        
        map[x][y] = new MapTile(m[x][y],y*30,x*30);
        
        if ( m[x][y] == 3 || m[x][y] == 4 ) {
          dotCount += 1;
        }
        
        if ( m[x][y] == 6 ) {
          start = map[x][y];
        }
        
        else if ( m[x][y] == 7 ) {
          if ( warp1 == null ) {
            warp1 = map[x][y];
          }
          else {
            warp2 = map[x][y];
          }
        }
        
      }
      
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
  
  int getMapLevel() {
    return mapLevel;
  }
  
 MapTile[][] retMap() {
     return map; 
  }
  
  void draw() {
    for ( int x = 0 ; x < map.length ; x++ ) {
      for ( int y = 0 ; y < map[x].length ; y++ ) {
        map[x][y].draw();
      }
    }
  }
  
}
