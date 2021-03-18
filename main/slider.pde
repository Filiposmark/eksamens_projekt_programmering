
class Slider {

  float x, y, linex, liney, steps, len, val, increments, size;
  String label, unit;
  boolean nulstillet, locked;

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
    locked = false;
  }

  void change() {
    if (!locked) {

      if (mousePressed && mouseX >= x-size && mouseX <= x+size && mouseY >= y-size && mouseY <= y+size) {
        x = mouseX;
        nulstillet = false;
      }

      if (mousePressed || nulstillet) {
        increments = len/steps; //pixels per step
        val = round(10*(((x-linex)/increments)))*0.1; //værdi er lig slider position (x) minus sliderstart (linex) delt med antal pixels per step = step. afrundet til 1 decimal.
      }

      if (label == "v0") {
        v0 = val;
      }

      if (label == "alpha") {
        alpha = radians(-val);
      }

      if (label == "y0") {
        y0 = y0Default-scale_size*val; //y0 er mellem y0default og
      }
    }
fill(0);
    text(val+unit, x, y-20);
  }

  void display() {

    fill(0);
    line(linex, liney, linex+len, y);
    if (locked) {
      fill(150, 150, 150);
    } else {
      fill(255);
    }
    circle(x, y, 15);
    fill(0);

    if (x >= linex+len) {
      x = linex+len;
    }

    if (x <= linex) {
      x = linex;
    } 
    textSize(16);
    text(label, (linex+len/2)-textWidth(label)/2, y+20);
  }
}
