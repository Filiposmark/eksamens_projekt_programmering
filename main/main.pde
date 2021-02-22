
float v0;
float alpha;
float y0, y0Default, x0, t;

float xSlut;
float ySlut;
float scale_size;
float y, x, g_;
boolean hit = false;
boolean hasbeen = false;
int skydframe;

Forhindring[] ForhindringsListe = new Forhindring[1];
Knap[] KnapListe = new Knap[3];


//Ball ball = new Ball(20,100,500); 
Slider[] SliderListe = new Slider[3];
Slider alpha_slider = new Slider(60, 60, 90, "alpha", "\u00b0");
Slider v0_slider = new Slider(60, 130, 40, "v0", "m/s");
Slider y0_slider = new Slider(60, 200, 5, "y0", "m");

ArrayList<Confetti> confetti = new ArrayList<Confetti>();

Box[] boxlist = new Box[2];
Sky[] skyliste = new Sky[5];
float[] sky_x = {100, 400, 700, 1000, 1300};
float[] sky_y = {100, 100, 100, 100, 100};

Tree[] treelist = new Tree[3];
float[] tree_x = {random(400, 700), random(800, 1000), random(1200, 1400)};
float[] tree_y = {random(450, 550), random(450, 550), random(450, 550)};


void setup() {
  frameRate(20);  
  size(1700, 900);

  for (int i = 0; i < 100; i++) {
    confetti.add(new Confetti(width/2, height/2));
    confetti.add(new Confetti(width/4, height/4));
    confetti.add(new Confetti(width-width/4, height/4));
  }

  for (int i = 0; i < skyliste.length; i++) {
    x = sky_x[i];
    y = sky_y[i];
    skyliste[i] = new Sky(x, y);
  }

  for (int i = 0; i < treelist.length; i++) {
    x = tree_x[i];
    y = tree_y[i];
    treelist[i] = new Tree(x, y);
  }


  for (int i = 0; i < skyliste.length; i++) {
    skyliste[i].setup_sky();
    skyliste[i].sky_size();
  }

  for (int i = 0; i < treelist.length; i++) {
    treelist[i].setup_crown();
  }


  xSlutGenerate();
  scale_size = Skalering(xSlut);


  y0DefaultGenerate();
  ySlutGenerate(); 

  x0 = scale_size*2;

  ForhindringsListe[0] = new Forhindring(xSlut, ySlut, "Circle", 0.5, 0.5, color(200, 50, 50), true);
  KnapListe[0] = new Genstart(width/2-260, height/2-50, 250, 100, "Prøv igen", color(100, 10, 100), 40, 255);
  KnapListe[1] = new nyBane(width/2+10, height/2-50, 250, 100, "Ny bane", color(100, 10, 100), 40, 255);
  KnapListe[2] = new Affyr(10, height-70, 120, 60, "Affyr", color(200, 25, 0), 22, 0);
  SliderListe[0] = alpha_slider;
  SliderListe[1] = v0_slider;
  SliderListe[2] = y0_slider;
  SliderListe[2].steps = (y0Default-275)/scale_size;



  boxlist[0] = new Box("Bold", x0+ballx(time), bally(time), 20., 20.);

  for (int i = 0; i < ForhindringsListe.length; i++) {
    boxlist[i] = new Box("Target", ForhindringsListe[i].x, ForhindringsListe[i].y, ForhindringsListe[i].Width, ForhindringsListe[i].Height);
  }
}

void draw() {


  background (30, 150, 250);
  pushMatrix();
  fill(50, 175, 50);
  rect(0, height-200, width, 200);
  popMatrix();

  //pushMatrix();
  //noStroke();
  //fill(20, 255, 0);
  //ellipse(x0, y0, BallSize, BallSize);
  //popMatrix();



  for (int i = 0; i < skyliste.length; i++) {
    skyliste[i].makeSky();
    skyliste[i].moveSky();
    skyliste[i].collision();
  }

  for (int i = 0; i < treelist.length; i++) {
    treelist[i].make_trunk();
    treelist[i].make_crown();
  }




  y0DefaultGenerate();
  DrawKanon();
  drawAfstande();

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].display();
    SliderListe[i].change();
  }

  for (int i = 0; i < ForhindringsListe.length; i++) {
    ForhindringsListe[i].DrawForhindring();
  }

  for (int i = 0; i < KnapListe.length; i++) {
    KnapListe[i].on = true;
    KnapListe[i].DrawKnap();
  }



  time = (frameCount-skydframe)/frameRate;
  if (skydframe > 0) {
    shoot();
  }

  if (hit) {
    for (int i = 0; i < confetti.size(); i++) {
      Confetti c = confetti.get(i);
      c.display();
      c.move();

      if (c.lifespan <= 0) {
        confetti.remove(c);
      }
    }
  }
  
  if (mousePressed) {
    hit = true;
  }
}


void mouseReleased() {
  for (int i = 0; i < KnapListe.length; i++) {
    if (KnapListe[i].Trykket()) {
      KnapListe[i].action();
    }
  }

  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].display();
    SliderListe[i].change();
  }
}

void drawAfstande() {
  int xLine = 35;

  fill(0);
  textSize(15);
  text("xSlut: "+xSlut+" m", (width/2)-(textWidth("xSlut; "+xSlut+ " m")/2), height-xLine+25);

  pushMatrix();
  translate(scale_size*(xSlut+3.3), y0Default-0.5*(ySlut*scale_size));
  rotate(PI/2);
  text("ySlut: "+ySlut+" m", 0-(textWidth("ySlut: "+ySlut+ " m")*0.5), 5);
  popMatrix();

  strokeWeight(3);
  //tegner linjer til x-afstand
  //line(x0, height-xLine, (width/2)-(textWidth(xSlut+ " m")/2)-10, height-xLine);
  //line((width/2)+(textWidth(xSlut+ " m")/2)+10, height-xLine, scale_size*(xSlut+2), height-xLine);
  line(x0, height-xLine, scale_size*(xSlut+2), height-xLine);

  line(x0, height-xLine+10, x0, height-xLine-10);
  line(scale_size*(xSlut+2), height-xLine+10, scale_size*(xSlut+2), height-xLine-10);

  //tegner linjer til y-afstand
  //line(scale_size*(xSlut+3), y0Default, scale_size*(xSlut+3), (y0Default-0.5*(ySlut*scale_size+50))+(textWidth(ySlut+ " m")/2)+10);
  //line(scale_size*(xSlut+3), y0Default-scale_size*ySlut, scale_size*(xSlut+3), (y0Default-0.5*(ySlut*scale_size+50))-(textWidth(ySlut+ " m")/2)-10);
  line(scale_size*(xSlut+3), y0Default, scale_size*(xSlut+3), y0Default-scale_size*ySlut);

  line(scale_size*(xSlut+3)-10, y0Default, scale_size*(xSlut+3)+10, y0Default);
  line(scale_size*(xSlut+3)-10, y0Default-scale_size*ySlut, scale_size*(xSlut+3)+10, y0Default-scale_size*ySlut);

  strokeWeight(1);
}

void xSlutGenerate() {
  xSlut = ((int) random(80, 200))*0.1;
}

void ySlutGenerate() {
  ySlut = ((int) random(0, 10*(y0Default*0.8)/scale_size))*0.1; //ySlut er et tilfældigt tal mellem 0 m og 80% af vinduets højde
}

void y0DefaultGenerate() {
  y0Default = height-scale_size*1.5-100;
}
