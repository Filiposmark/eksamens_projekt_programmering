
float v0;
float alpha;
float y0;
PVector gra = new PVector(0, 10);
PVector shot = new PVector(v0*cos(-alpha), v0*sin(-alpha));

float xSlut;
float ySlut;
float scale_size;

Forhindring[] ForhindringListe = new Forhindring[1];
Knap[] KnapListe = new Knap[1];


//Ball ball = new Ball(20,100,500); 
Slider[] SliderListe = new Slider[3];
Slider alpha_slider = new Slider(100, 100, 90, "alpha", "\u00b0");
Slider v0_slider = new Slider(100, 175, 20, "v0", "m/s");
Slider y0_slider = new Slider(100, 250, 5, "y0", "m");

void setup() {
  size(1700, 900);
  xSlut = round(random(8, 20)*10)*0.1;
  ySlut = round(random(1, 5)*10)*0.1;
  scale_size = Skalering(xSlut);
  ForhindringListe[0] = new Forhindring(xSlut, ySlut, "Circle", 0.5, 0.5, color(200, 50, 50), true);
  KnapListe[0] = new Genstart(width/2-250, height/2-50, 250, 100, "Prøv igen", color(100, 10, 100));
  SliderListe[0] = alpha_slider;
  SliderListe[1] = v0_slider;
  SliderListe[2] = y0_slider;
}

void draw() {
  /*ball.display();
   ball.applyForce(gra);
   ball.applyForce(shot);
   ball.update();*/

  background (200);
  //pushMatrix();
  //noStroke();
  //fill(20, 255, 0);
  //ellipse(x0, y0, BallSize, BallSize);
  //popMatrix();



  DrawKanon();

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].display();
    SliderListe[i].change();
  }

  println("alpha: "+alpha);
  println("v0: " + v0);
  println("y0: " +y0);

  for (int i = 0; i < ForhindringListe.length; i++) {
    ForhindringListe[i].DrawForhindring();
  }

  for (int i = 0; i < KnapListe.length; i++) {
    KnapListe[i].on = true;
    KnapListe[i].DrawKnap();
  }
}


void mouseReleased() {
  for (int i = 0; i < KnapListe.length; i++) {
    if (KnapListe[i].Trykket()){
    KnapListe[i].action();
    }
  }
}
