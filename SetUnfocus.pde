/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/
TextObject unfocusedWord = null;

public class SetUnfocus extends TTYSAction {
    
    boolean unfocus;
  
    /**
     * 
     * Creates a new instance of Adopt
     */
    public SetUnfocus(boolean f) {
      unfocus = f;
    }
   
    /** 
     * Switch a TextObject's parent.
     *
     * @param to the TextObject to act upon
     */
    public ActionResult behave(TextObject to) {
        BooleanProperty unfocusProperty = getUnfocus(to);

    	unfocusProperty.set(unfocus);
    
        if (unfocus && (unfocusedWord == null))
          unfocusedWord = to;
        else if (!unfocus && (unfocusedWord == to))
          unfocusedWord = null;

        return new ActionResult(true, true, true);
    }  
}
