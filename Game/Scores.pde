/*=============================================
  class Scores -- Uses TreeNode for HIGH SCORES!
  =============================================*/

class Scores {
  
    TreeNode _root;
  
    Scores() {
	    _root = null;
    }
  
    public void insert( int newVal, String name ) {
      TreeNode newNode = new TreeNode( newVal, name );

      if ( _root == null ) {
          _root = newNode;
          return;
      }
      insert( _root, newNode );
    }
    
    //recursive helper for insert(int)
    public void insert( TreeNode stRoot, TreeNode newNode ) {

      if ( newNode.getValue() > stRoot.getValue() ) {
          if ( stRoot.getLeft() == null ) {
              stRoot.setLeft( newNode );
          }
          else  { //recurse down left subtree
              insert( stRoot.getLeft(), newNode );
              return;
          }
        }
        
      else { 
          if ( stRoot.getRight() == null ) {
              stRoot.setRight( newNode );
          }
          else { //recurse down right subtree
              insert( stRoot.getRight(), newNode );
              return;
          }
        }
        
    }
    
	public void inOrderTrav() {
	    inOrderTrav( _root );
	}

	public void inOrderTrav( TreeNode currNode ) {
	    if ( currNode == null ) { //stepped beyond leaf
		    return;
      }
	    inOrderTrav( currNode.getLeft() );
	    System.out.print( currNode.getValue() + ": by " + currNode.getName() );
	    inOrderTrav( currNode.getRight() );
	}

}