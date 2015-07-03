/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/

TextObject focusedWord = null;

public class SetFocus extends TTYSAction {
    
    boolean focus;
  
    /**
     * 
     * Creates a new instance of Adopt
     */
    public SetFocus(boolean f) {
      focus = f;
    }
   
    /** 
     * Switch a TextObject's parent.
     *
     * @param to the TextObject to act upon
     */
    public ActionResult behave(TextObject to) {
        BooleanProperty focusProperty = getFocus(to);

        if (focus && (focusedWord == null))
          focusedWord = to;
        else if (!focus && (focusedWord == to))
          focusedWord = null;
          
    	focusProperty.set(focus);
    
        return new ActionResult(true, true, true);
    }  
}
