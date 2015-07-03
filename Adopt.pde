/**
 * Behaviour that switches the parent of a text object for a new one.
 
 Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
 */
public class Adopt extends AbstractAction {
  
    TextObjectGroup parent;
  
    /**
     * 
     * Creates a new instance of Adopt
     */
    public Adopt(TextObjectGroup parent) {
      this.parent = parent;
    }
   
    /** 
     * Switch a TextObject's parent.
     *
     * @param to the TextObject to act upon
     */
    public ActionResult behave(TextObject to) {
        PVector prevAbsPos = to.getPositionAbsolute();
        Color prevColor = to.getColorAbsolute();

        to.detach();
        parent.attachChild(to);

        PVector newAbsPos = to.getPositionAbsolute();
        to.getPosition().add(new PVector(prevAbsPos.x-newAbsPos.x, prevAbsPos.y-newAbsPos.y, prevAbsPos.z-newAbsPos.z));
        to.getColor().set(prevColor);
        
        //println("Adopt: " + parent);
        
        return new ActionResult(true, true, true);
    }  
}
