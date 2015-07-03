
/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/

public class HasFocus extends Condition {
    
  boolean focus; 
  
  public HasFocus(net.nexttext.behaviour.Action trueAction) {
    this(trueAction, true);
  }

  public HasFocus(net.nexttext.behaviour.Action trueAction, boolean focus) {
    this(trueAction, new DoNothing(), focus);
  }

  public HasFocus(net.nexttext.behaviour.Action trueAction, net.nexttext.behaviour.Action falseAction, boolean focus) {
    super(trueAction, falseAction);
    this.focus = focus;
  }

  /**
   * Gets the set of properties required by all TTYSAction
   *
   * @return Map containing the properties
   */
  /*public Map getRequiredProperties() {
    Map properties = super.getRequiredProperties();

    BooleanProperty focus = new BooleanProperty(false);
    properties.put("Focus", focus);

    return properties;
  }*/
    
  public boolean condition(TextObject to) {
    BooleanProperty focusProperty = (BooleanProperty)to.getProperty("Focus");
    return focusProperty.get() == focus;
  }
}

