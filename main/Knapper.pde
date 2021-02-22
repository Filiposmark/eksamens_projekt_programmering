

class Knap {
  int x, y, Height, Width, textSize;
  color farve, textColor;
  String label;
  boolean on;

  Knap(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    this.x = x;
    this.y = y;
    this.Height = Height;
    this.Width = Width;
    this.label = label;
    this.farve = farve;
    this.textSize = textSize;
    this.textColor = textColor;

    on = false;
  }

  void DrawKnap() {
    if (on) {
      pushMatrix();
      noStroke();
      fill(farve);
      rect(x, y, Width, Height);

      fill(textColor);
      textSize(textSize);
      text(label, x+(Width/2)-(textWidth(label)/2), y+(Height/2)+10);
      popMatrix();
    }
  }

  boolean Trykket() {
    if (on) {
      boolean trykket = false;

      if (mouseX >= x && mouseX <= x+Width && mouseY >= y && mouseY <= y+Height) {
        trykket = true;
      }

      return(trykket);
    } else {
      return false;
    }
  }

  void action() {
  }
}





class Genstart extends Knap {
  Genstart(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    reset();
  }
}




class Affyr extends Knap {
  Affyr(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
    
    on = true;
  }

  void action () {
    skydframe = get_frame();
  }
}




class nyBane extends Knap {
  nyBane(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
    
  }

  void action () {
    reset();
    xSlutGenerate();
    scale_size = Skalering(xSlut);
    y0DefaultGenerate();
    ySlutGenerate();

    x0 = scale_size*2;
    y0 = y0Default;

    SliderListe[2].steps = (y0Default-275)/scale_size;

    ForhindringsListe[0].x = xSlut;
    ForhindringsListe[0].y = ySlut;
  }
}







void reset() {

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].x = 100;
    SliderListe[i].x = 1;
    SliderListe[i].nulstillet = true;
    SliderListe[i].display();
  }
  //tid = 0;
}
