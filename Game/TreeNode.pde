class TreeNode {

    //instance variables / attributes of a TreeNode:
    String[] _cargo = new String[2];        //this node's data
    TreeNode _lt, _rt; //pointers to left, right subtrees


    /*****************************************************
     * default constructor
     * Construct a tree node with specified value,
     * with null left and right subtrees.
     *****************************************************/
    TreeNode( int initValue, String name )
    {
        _cargo[0] = Integer.toString(initValue);
        _cargo[1] = name;
    }


    /*****************************************************
     * overloaded constructor
     * Construct tree node w specified value, left, and right subtrees.
     *****************************************************/
    TreeNode( int initValue, String name, TreeNode initLeft, TreeNode initRight )
    {
        this(initValue,name);
        _lt = initLeft;
        _rt = initRight;
    }


    /*****************************************************
     * Returns the left subtree of this node.
     *****************************************************/
    TreeNode getLeft()
    {
        return _lt;
    }


    /*****************************************************
     * Returns the right subtree of this node.
     *****************************************************/
    TreeNode getRight()
    {
        return _rt;
    }


    /*****************************************************
     * Returns the value stored in this tree node.
     *****************************************************/
   int  getValue()
    {
        return Integer.parseInt(_cargo[0]);
    }


    String getName() {
     return _cargo[1]; 
    }

    /*****************************************************
     * Sets the value of the left subtree of this node.
     *****************************************************/
    void setLeft( TreeNode theNewLeft )
    {
        _lt = theNewLeft;
    }


    /*****************************************************
     * Sets the value of the right subtree of this node.
     *****************************************************/
    void setRight( TreeNode theNewRight )
    {
        _rt = theNewRight;
    }


    /*****************************************************
     * Sets the value of this tree node.
     *****************************************************/
    void setValue( int theNewValue , String name)
    {
        _cargo[0] = Integer.toString(theNewValue);
        _cargo[1] = name;
    }

}//end class
