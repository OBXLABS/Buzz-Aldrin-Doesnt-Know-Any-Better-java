/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/

public class BringToFront extends AbstractAction {

    public BringToFront() {
    }

    public ActionResult behave(TextObject to) {
      //get the parent
      TextObjectGroup parent = to.getParent();
      if (parent == null)
        return new ActionResult(false, false, false);
        
      to.detach();
      parent.attachChild(to);
      return new ActionResult(true, true, true);
    }
}
