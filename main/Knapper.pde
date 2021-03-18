

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
    if (!Affyret && v0 > 0) {
      skydframe = get_frame();
      Affyret = true;
    }
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
    if (withTasks) {
      opgave();
    }
  }
}


class StartSpil_opgave extends Knap {
  StartSpil_opgave(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    for (int i = 2; i < KnapListe.length; i++) {
      if (i <= 3) {
        KnapListe[i].on = true;
      } else {
        KnapListe[i].on = false;
      }
    }
    withTasks = true;
    opgave();
    Welcome = false;
  }
}

//Knap som starter spillet uden opgaver
class StartSpil_fri extends Knap {
  StartSpil_fri(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    for (int i = 2; i < KnapListe.length; i++) {
      if (i <= 3) {
        KnapListe[i].on = true;
      } else {
        KnapListe[i].on = false;
      }
    }

    withTasks = false;
    Welcome = false;
  }
}


//Knap som lukke spille-vinduet og går til startskærmen. 
class AfslutSpil extends Knap {
  AfslutSpil(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    Welcome = true;
  }
}

//Knap som afslutter spillet, ved at lukke vinduet
class Exit extends Knap {
  Exit(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    exit();
  }
}

//Funktion der nulstiller slidere, fjerner knapper og gør så man kan skydde igen.
void reset() {

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].x = 100;
    SliderListe[i].x = 1;
    SliderListe[i].nulstillet = true;
    SliderListe[i].display();
  }
  KnapListe[0].on = false;
  KnapListe[1].on = false;

  hit = false;
  Affyret = false;
  missed = false;
}
