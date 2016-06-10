/*=============================================
  class Map -- The map of the game!
  Required classes: MapTile, Stack, ALStack
  =============================================*/
  
class Map {
  
  ArrayList<MapTile> map = new ArrayList<MapTile>(); //should this be an arraylist tho?
  int mapLevel;
  Stack map1;
  Stack map2;
  Stack map3;
  
  Map() {
    mapLevel = 1;
  }
  
  void nextMap() {
    mapLevel += 1;
    if ( mapLevel == 2 ) { 
      setMap(map1);
    }
    else if ( mapLevel == 3 ) { 
      setMap(map2);
    }
    else {
      mapLevel = 1;
      setMap(map3);
    }
  }
  
  void setMap(Stack m) {
  }
  
  void makeMap1() {
    
  }
  
}