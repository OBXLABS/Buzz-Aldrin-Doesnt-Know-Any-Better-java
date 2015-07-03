/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/
public class HasUnfocus extends Condition {
    
  boolean unfocus; 
  
  public HasUnfocus(net.nexttext.behaviour.Action trueAction) {
    this(trueAction, true);
  }

  public HasUnfocus(net.nexttext.behaviour.Action trueAction, boolean unfocus) {
    this(trueAction, new DoNothing(), unfocus);
  }

  public HasUnfocus(net.nexttext.behaviour.Action trueAction, net.nexttext.behaviour.Action falseAction, boolean unfocus) {
    super(trueAction, falseAction);
    this.unfocus = unfocus;
  }

  public boolean condition(TextObject to) {
    BooleanProperty unfocusProperty = (BooleanProperty)to.getProperty("Unfocus");
    return unfocusProperty.get() == unfocus;
  }
}

