
float v0;
float alpha;
float y0;
PVector gra = new PVector(0, 10);
PVector shot = new PVector(v0*cos(-alpha),v0*sin(-alpha));

float scale_size;



//Ball ball = new Ball(20,100,500); 
Slider alpha_slider = new Slider(100,100, 90, "alpha", "\u00b0");
Slider v0_slider = new Slider(100,200,20, "v0", "m/s");
Slider y0_slider = new Slider(100,300, 5, "y0", "m");

void setup() {
  size(1700, 900);
  scale_size = Skalering(250);
  
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
  
}
