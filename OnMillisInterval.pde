/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
*/
public class OnMillisInterval extends Condition {
    
  long interval;
  
  public OnMillisInterval(net.nexttext.behaviour.Action trueAction, long interval) {
    this(trueAction, new DoNothing(), interval);
  }

  public OnMillisInterval(net.nexttext.behaviour.Action trueAction, net.nexttext.behaviour.Action falseAction, long interval) {
    super(trueAction, falseAction);
    this.interval = interval;
  }
    
  public boolean condition(TextObject to) {
    Long startTime = (Long)textObjectData.get(to);
    if (startTime == null) {
      textObjectData.put(to, new Long(millis()));
      return false;
    }
    
    long now = millis();
    if ((now - startTime.longValue()) >= interval) {
      textObjectData.put(to, new Long(now));
      return true;
    }
    else {
      return false;
    }
  }
}

