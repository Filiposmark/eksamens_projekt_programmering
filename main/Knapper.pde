

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
    reset();
    
    //Hvis man trykker "Prøv igen", trækker man 20 point fra de point man får for skuddet.
    current_score -= 20;
    
  }
}




class Affyr extends Knap { //Knappen "Affyr" tager informaition fra paraent classen.
  Affyr(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
 
    on = true;
  }

  void action () { //Starter skuddet
    skydframe = get_frame();
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
    opgave();
    
    current_score = 100;
  }
}


class StartSpil extends Knap {
  StartSpil(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    for (int i = 0; i < KnapListe.length; i++) {
      if (i <= 3) {
        KnapListe[i].on = true;
      } else {
        KnapListe[i].on = false;
      }
    }
    
    opgave();
    Welcome = false;
    
  }
}

class AfslutSpil extends Knap {
  AfslutSpil(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    Welcome = true;
    
  }
}


class Exit extends Knap {
  Exit(int x, int y, int Width, int Height, String label, color farve, int textSize, color textColor) {
    super (x, y, Width, Height, label, farve, textSize, textColor);
  }

  void action () {
    exit();
  }
}


void reset() {

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].x = 100;
    SliderListe[i].x = 1;
    SliderListe[i].nulstillet = true;
    SliderListe[i].display();
  }
  
  hit = false;
  
  
  
  
}
