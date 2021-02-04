


class Forhindring {

  float x, y, Width, Height;
  boolean target, hit;
  color farve;
  String Shape; 

  Forhindring(float x, float y, String Shape, float Width, float Height, color farve, boolean target) {
    this.x = x;
    this.y = y;
    this.Shape = Shape;
    this.Width = Width;
    this.Height = Height;
    this.farve = farve;
    this.target = target;
  }


  void DrawForhindring() {

    pushMatrix();
    noStroke();
    fill(farve);

    if (Shape == "Rectangle") {

      rectMode(CENTER);
      rect(scale_size*x, height-scale_size*y, scale_size*Width, scale_size*Height);
    } else if (Shape == "Circle") {
      ellipse(scale_size*x, height-scale_size*y, scale_size*Width, scale_size*Height);
    } else {
      println("intet");
    }
    popMatrix();
  }
}