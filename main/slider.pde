
class Slider {

  float x, y, linex, liney, steps, len, val, increments, size;
  String label, unit;
  boolean nulstillet;

  Slider(float x, float y, float steps, String label, String unit) {
    this.x = x;
    this.y = y;
    linex = x;
    liney = y;
    this.steps = steps;
    this.label = label;
    this.unit = unit;
    len = 100;
    size = 10;
    nulstillet = true;
  }

  void change() {

    if (mousePressed && mouseX >= x-size && mouseX <= x+size && mouseY >= y-size && mouseY <= y+size) {
      x = mouseX;
      nulstillet = false;
    }

    if (mousePressed || nulstillet) {
      increments = steps/len;
      val = (x*increments)-steps;
    }

    if (label == "v0") {
      v0 = scale_size*val;
    }

    if (label == "alpha") {
      alpha = radians(-val);
    }

    if (label == "y0") {
      y0 = (height-300)-scale_size*val;
    }


    text(val+unit, x, y-20);
  }

  void display() {

    fill(0);
    line(linex, liney, linex+100, y);
    fill(255);
    circle(x, y, 15);

    if (x >= linex+100) {
      x = linex+100;
    }

    if (x <= linex) {
      x = linex;
    } 
    textSize(16);
    text(label, (linex+len/2)-textWidth(label)/2, y+20);
  }
}
