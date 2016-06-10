/*=============================================
  class Map -- The map of the game!
  Required classes: MapTile
  =============================================*/
  
class Map {
  
  ArrayList<MapTile> map = new ArrayList<MapTile>(); //should this be an arraylist tho?
  final int[] MAP1 = {1,2,3};
  final int[] MAP2 = {1,2,3};
  final int[] MAP3 = {1,2,3};
  int mapLevel;
  
  Map() {
    mapLevel = 1;
  }
  
  void nextMap() {
    mapLevel += 1;
    if ( mapLevel == 2 ) { 
      setMap(MAP2);
    }
    else if ( mapLevel == 3 ) { 
      setMap(MAP3);
    }
    else {
      mapLevel = 1;
      setMap(MAP1);
    }
  }
  
  void setMap(int[] m) {
  }
  
}