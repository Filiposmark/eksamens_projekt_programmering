

class Knap { //Laver klassen knapper
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

    //Knapperne er ikke aktive som default
    on = false;
  }

  //Knapperne bliver tegnet ved deres information som givet i constructoren
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

  //Hvis der er blevet trykket på knappen bliver den aktiveret.
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

  void action() { //Action for en knap er generelt tom, da den bliver defineret i en subclass.
  }
}





class Genstart extends Knap { //Knappen "Genstart" tager informaition fra paraent classen.
  Genstart(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  //Definerer sin action som "reset()"
  void action () {
    if (!hit) {
      reset();


      //Hvis man trykker "Prøv igen", trækker man 20 point fra de point man får for skuddet.
      if (current_score > 0) {
        current_score -= 20;
      }
    }
  }
}




class Affyr extends Knap { //Knappen "Affyr" tager informaition fra paraent classen.
  Affyr(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);

    on = true;
  }


  void action () { //Starter skuddet
    if (!Affyret && v0 > 0) {

      skydframe = get_frame();
      Affyret = true;
    }
  }
}




class nyBane extends Knap { //Knappen "nyBane" tager informaition fra paraent classen.
  nyBane(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () { //Gør det samme som "Genstart" laver bare også en ny bane.
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
    current_score = 100;
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
    reset();
    Welcome = true;
    score = 0;
    
    for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].locked = false;
  }
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
