class Box {
  String tag;
  float x, y, w, h; 

  Box (String tag_in, float x_in, float y_in, float w_in, float h_in) {
    tag = tag_in;
    x = x_in;
    y = y_in;
    w = w_in;
    h = h_in;
  }
}



boolean valueInRange(float val, float min, float max) {
  return (val >= min) && (val <= max);
}

boolean boxCollision(Box A, Box B) {
  boolean xOverlap = valueInRange(A.x, B.x, B.x+B.w) || valueInRange(B.x, A.x, A.x + A.w);
  boolean yOverlap = valueInRange(A.y, B.y, B.y+B.h) || valueInRange(B.y, A.y, A.y+A.h);
  return xOverlap && yOverlap;
}
