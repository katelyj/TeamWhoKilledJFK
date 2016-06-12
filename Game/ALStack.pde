/*****************************************************
 * class ALStack
 * Implements ADT Stack, generically typed.
 * Uses an ArrayList as underlying container.
 *****************************************************/

import java.util.ArrayList;

public class ALStack<T> implements Stack<T> {

  private ArrayList<T> _stack;
  
  public ALStack() { 
	  _stack = new ArrayList<T>();
  }

  public ALStack( int size ) { 
	  _stack = new ArrayList<T>(size);
  }

  public void push( T s ) {
    _stack.add(s);  
  }

  public T peek( ) { 
	  T retVal = null;
	  if ( isEmpty() )  return null;
	  retVal = _stack.get( _stack.size()-1 );
	  return retVal;
  }

  public T pop( ) { 
	  T retVal = null;
	  if ( isEmpty() )  return null;
	  retVal = _stack.remove( _stack.size()-1 );
	  return retVal;
  }

  public boolean isEmpty() { 	return _stack.size() == 0;  }
  
  public int getSize() { return _stack.size(); }

}