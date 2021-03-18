

//Klasse for objekt, som enten er en forhindring eller et mål.
class Forhindring { 

  float x, y, Width, Height;
  boolean target, hit; //target bestemmer om forhindringen er et mål eller ej.
  color farve;
  String Shape; //bestemmer om det er rektangel eller cirkel.

  Forhindring(float x, float y, String Shape, float Width, float Height, color farve, boolean target) {
    this.x = x;
    this.y = y;
    this.Shape = Shape;
    this.Width = Width;
    this.Height = Height;
    this.farve = farve;
    this.target = target;
  }

//tegner forhindringen
  void DrawForhindring() {

    pushMatrix();
    noStroke();
    fill(farve);

    if (Shape == "Rectangle") {
      rectMode(CENTER);
      rect(scale_size*(x+2), height-scale_size*y, scale_size*Width, scale_size*Height);
    } else if (Shape == "Circle" && !target) {
      ellipse(scale_size*(x+2), height-scale_size*y, scale_size*Width, scale_size*Height);
    } else if (Shape == "Circle" && target) {
      ellipse(scale_size*(x+2), y0Default-scale_size*y, scale_size*Width, scale_size*Height);
    }
    popMatrix();
  }
}
