

class Knap {
  int x, y, Height, Width;
  color farve;
  String label;
  boolean on;

  Knap(int x, int y, int Width, int Height, String label, color farve) {
    this.x = x;
    this.y = y;
    this.Height = Height;
    this.Width = Width;
    this.label = label;
    this.farve = farve;

    on = true;
  }

  void DrawKnap() {
    if (on) {
      pushMatrix();
      noStroke();
      fill(farve);
      rect(x, y, Width, Height);

      fill(255);
      textSize(40);
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
  Genstart(int x, int y, int Width, int Height, String label, color farve) {
    super (x, y, Width, Height, label, farve);
  }

  void action () {
    xSlut = round(random(8, 20)*10)*0.1;
    ySlut = round(random(1, 5)*10)*0.1;

    for (int i = 0; i < SliderListe.length; i++) {
      SliderListe[i].x = 100;
      SliderListe[i].x = 1;
      SliderListe[i].nulstillet = true;
      SliderListe[i].display();
    }

    //tid = 0;
  }
}


class Affyr extends Knap {
  Affyr(int x, int y, int Width, int Height, String label, color farve) {
    super (x, y, Width, Height, label, farve);
  }

  void action () {
  }
}


class Next extends Knap {
  Next(int x, int y, int Width, int Height, String label, color farve) {
    super (x, y, Width, Height, label, farve);
  }

  void action () {
  }
}
