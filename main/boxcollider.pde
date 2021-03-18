
//Klasse til box, som lægges rundt om objekter, for at tjekke om objekterne kolliderer.
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


//funktion der tjekker om et input er mellem to værdier.
boolean valueInRange(float val, float min, float max) { 
  return (val >= min) && (val <= max);
}

//funktion der tjekker om to boxe er inden i hinanden.
boolean boxCollision(Box A, Box B) { 
  boolean xOverlap = valueInRange(A.x, B.x, B.x+B.w) || valueInRange(B.x, A.x, A.x + A.w); //Ser om den ene box' x-koordinat er inden for den anden box's x-koordinater eller omvendt
  boolean yOverlap = valueInRange(A.y, B.y, B.y+B.h) || valueInRange(B.y, A.y, A.y+A.h); //Ser om den ene box' y-koordinat er inden for den anden box's y-koordinater eller omvendt
  return xOverlap && yOverlap; // kun hvis både x og y overlapper, har objekterne ramt hinanden.
}
