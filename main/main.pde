
float v0;
float alpha;
float y0;
PVector gra = new PVector(0, 10);
PVector shot = new PVector(v0*cos(-alpha), v0*sin(-alpha));

float xSlut = round(random(8, 20)*10)*0.1;
float ySlut = round(random(1, 5)*10)*0.1;
float scale_size;

Forhindring[] ForhindringListe = new Forhindring[1];


//Ball ball = new Ball(20,100,500); 
Slider alpha_slider = new Slider(100, 100, 90, "alpha", "\u00b0");
Slider v0_slider = new Slider(100, 200, 20, "v0", "m/s");
Slider y0_slider = new Slider(100, 300, 5, "y0", "m");

void setup() {
  size(1700, 900);
  scale_size = Skalering(xSlut);
  ForhindringListe[0] = new Forhindring(xSlut, ySlut, "Circle", 0.5, 0.5, color(200, 50, 50), true);
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


  alpha_slider.display();
  alpha_slider.change();
  v0_slider.display();
  v0_slider.change();
  y0_slider.display();
  y0_slider.change();


  println("alpha: "+alpha);
  println("v0: " + v0);
  println("y0: " +y0);

  for (int i = 0; i < ForhindringListe.length; i++) {
    ForhindringListe[i].DrawForhindring();
  }
}
