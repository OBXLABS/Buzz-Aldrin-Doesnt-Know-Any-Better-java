/*
Copyright (C) <2015>  <Jason Lewis>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the BSD 3 clause with added Attribution clause license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   BSD 3 clause with added Attribution clause License for more details.
   */
public class TextObjectGlyphIteratorBack {

  // It buffers the next Glyph to be returned.  This is necessary to do
  // hasNext() properly.
  TextObjectGlyph next;

  // It can't extend TextObjectIterator, since it needs to change the return
  // type of next().  Instead it wraps it.
  TextObjectIteratorBack iterator;

  TextObjectGlyphIteratorBack(TextObjectGroup group) {
    iterator = new TextObjectIteratorBack(group);
    bufferNextGlyph();
  }

  private void bufferNextGlyph() {
    while (iterator.hasNext()) {
      TextObject to = iterator.next();
      if (to instanceof TextObjectGlyph) {
        next = (TextObjectGlyph) to;
        return;
      }
    }
    next = null;
  }

  /** If the traversal is complete. */
  public boolean hasNext() { return next != null; }

  /** Get the next node in the traversal. */
  public TextObjectGlyph next() {
    TextObjectGlyph current = next;
    bufferNextGlyph();
    return current;
  }
}

