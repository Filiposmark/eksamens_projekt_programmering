

int skydframe, score, current_score;
float y0, y0Default, x0, t, xSlut, alpha, v0, ySlut, scale_size, y, x, g_;
boolean missed = false;
boolean Affyret = false;


boolean hit = false;
boolean hasbeen = false;
boolean Welcome = true;

 
//Definerer slider liste og slidere 

boolean withTasks;


Forhindring[] ForhindringsListe = new Forhindring[1];

Knap[] KnapListe = new Knap[7];



Slider[] SliderListe = new Slider[3];
Slider alpha_slider = new Slider(60, 60, 90, "alpha", "\u00b0");
Slider v0_slider = new Slider(60, 130, 30, "v0", "m/s");
Slider y0_slider = new Slider(60, 200, 1, "y0", "m"); //tilfældig Steps-værdi. ændres senere.

//Definerer arrayliste til konfetti
ArrayList<Confetti> confetti = new ArrayList<Confetti>();

//Definerer baggrunds- og interaktive elementer
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
  current_score = 100;

//Initialiserer konfetti til forskellige positioner paa banen 
  for (int i = 0; i < 100; i++) {
    confetti.add(new Confetti(width/2, height-height/4));
    confetti.add(new Confetti(width/4, height/4));
    confetti.add(new Confetti(width-width/4, height/4));
  }

//Initaliserer baggrundselementer
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

//Genererer banen
  xSlutGenerate();
  scale_size = Skalering(xSlut);
  y0DefaultGenerate();
  ySlutGenerate(); 

  x0 = scale_size*2;


//Generer målet, knapper og slidere
  ForhindringsListe[0] = new Forhindring(xSlut, ySlut, "Circle", 0.5, 0.5, color(200, 50, 50), true);
  
  KnapListe[0] = new Genstart(width/2-260, height/2-50, 250, 100, "Prøv igen", color(100, 10, 100), 40, 255);
  KnapListe[1] = new nyBane(width/2+10, height/2-50, 250, 100, "Ny bane", color(100, 10, 100), 40, 255);
  KnapListe[2] = new Affyr(10, height-70, 120, 60, "Affyr", color(200, 25, 0), 22, 0);
  KnapListe[3] = new AfslutSpil(width-130, height-70, 120, 60, "Afslut", color(200, 25, 0), 22, 0);
  KnapListe[4] = new StartSpil_opgave(width/2-275, height/2-110, 250, 100, "Opgaver", color(100, 10, 100), 40, 255);
  KnapListe[5] = new StartSpil_fri(width/2+25, height/2-110, 250, 100, "Frit Spil", color(100, 10, 100), 40, 255);
  KnapListe[6] = new Exit(width/2-125, height/2+10, 250, 100, "Luk Spil", color(100, 10, 100), 40, 255);
 
  SliderListe[0] = alpha_slider;
  SliderListe[1] = v0_slider;
  SliderListe[2] = y0_slider;
  SliderListe[2].steps = (y0Default-275)/scale_size; //y0 kan være mellem 0m og afstanden til et sted lige under sliderne. Kanonen kan derfor ikke rykkes op i sliderne.
}

void draw() {
  
  //Viser velkomstskærm
  if (Welcome) {
    background(50, 175, 50);

    for (int i = 0; i < KnapListe.length; i++) {
      if (i <= 3) {
        KnapListe[i].on = false;
      } else {
        KnapListe[i].on = true;
      }
    }

    for (int i = 0; i < KnapListe.length; i++) {
      KnapListe[i].DrawKnap();
    }
    fill(50);
    textSize(30);
    text("Velkommen til", (width/2)-0.5*textWidth("Velkommen"), 100);
    fill(0);
    textSize(80);
    text("Fysik på Jorden", (width/2)-0.5*textWidth("Fysik på Jorden"), 200);

    y0DefaultGenerate();
    y0 = y0Default;
    alpha = atan((mouseY-y0)/(mouseX-x0));
    DrawKanon();
  } else {

//starter selve spillet
    background (30, 150, 250);
    pushMatrix();
    fill(50, 175, 50);
    rect(0, height-200, width, 200);
    popMatrix();




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

    //Viser point scoren
    pushMatrix();
    textSize(40);
    String score_string = "Point: "+score;
    text(score_string, width-textWidth(score_string)-30, 70);
    popMatrix();

    //Viser slidere, målet og knapper
    for (int i = 0; i < SliderListe.length; i++) {
      SliderListe[i].display();
      SliderListe[i].change();
    }


    for (int i = 0; i < ForhindringsListe.length; i++) {
      ForhindringsListe[i].DrawForhindring();
    }


    for (int i = 0; i < KnapListe.length; i++) {
      KnapListe[i].DrawKnap();
    }

    
    
    //Definerer tiden det har taget skuddet
    time = (frameCount-skydframe)/frameRate;
    
    //Skuddet starter hvis parametre er opfyldt
    if (skydframe > 0) {
      shoot();
    }
    
    
   
    //Hvis målet bliver ramt, kommer der konfetti
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

    
    
    //Angiver kollisionen mellem bolden og målet
    rectMode(CENTER);
    boxlist[0] = new Box("Bold", x0+ballx(time), bally(time), 20., 20.);
    boxlist[1] = new Box("Target", scale_size*(ForhindringsListe[0].x+2), y0Default-scale_size*ForhindringsListe[0].y, scale_size*ForhindringsListe[0].Width, scale_size*ForhindringsListe[0].Height);
    rectMode(CORNER);


    //Hvis bolden og målet kolliderer bliver parametren "hit" true, og der kommer konfetti. Scoren bliver opdateret.
    if (boxCollision(boxlist[0], boxlist[1])) {
      hit = true;
      score += current_score;
    }
  }

  //Der bliver tilføjet ny konfetti, når det gamle er væk
  if (confetti.size() == 0) {
    for (int i = 0; i < 100; i++) {
      confetti.add(new Confetti(width/2, height-height/4));
      confetti.add(new Confetti(width/4, height/4));
      confetti.add(new Confetti(width-width/4, height/4));
    }
   }

//Hvis man rammer eller skyder forbi, vises knapper
    if (hit || missed) {
      if (missed){          //Prøv igen knap vises kun hvis der skydes forbi.
        KnapListe[0].on = true;
      }
      KnapListe[1].on = true;
    }
   
  

  if (Affyret && (ballx(time) >= width || bally(time) >= height)) {
    missed = true;

  }
}


void mouseReleased() {
  
  //Knapper og slidere bliver aktiveret på "mouseReleased"
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
  
  
  //Linjer bliver tegnet på baggrund af skalering.
  fill(0);
  textSize(15);
  text("xSlut: "+xSlut+" m", (width/2)-(textWidth("xSlut; "+xSlut+ " m")/2), height-xLine+25);

  pushMatrix();
  translate(scale_size*(xSlut+3.3), y0-0.5*(y0-(y0Default-scale_size*ySlut)));
  rotate(PI/2);
  text("ySlut: "+(round(10*((y0-y0Default)/scale_size+ySlut))*0.1)+" m", 0-(textWidth("ySlut: "+(round(10*((y0-y0Default)/scale_size+ySlut))*0.1)+ " m")*0.5), 5);
  popMatrix();

  strokeWeight(3);
  //tegner linjer til x-afstand
  line(x0, height-xLine, scale_size*(xSlut+2), height-xLine);

  line(x0, height-xLine+10, x0, height-xLine-10);
  line(scale_size*(xSlut+2), height-xLine+10, scale_size*(xSlut+2), height-xLine-10);

  //tegner linjer til y-afstand
  line(scale_size*(xSlut+3), y0, scale_size*(xSlut+3), y0Default-scale_size*ySlut);

  line(scale_size*(xSlut+3)-10, y0, scale_size*(xSlut+3)+10, y0);
  line(scale_size*(xSlut+3)-10, y0Default-scale_size*ySlut, scale_size*(xSlut+3)+10, y0Default-scale_size*ySlut);

  strokeWeight(1);
}

//Banen bliver defineret

void xSlutGenerate() {
  xSlut = ((int) random(80, 200))*0.1;
}

void ySlutGenerate() {
  ySlut = ((int) random(-1, 10*(y0Default*0.8)/scale_size))*0.1; //ySlut er et tilfældigt tal mellem -1 m og 80% af vinduets højde
}

void y0DefaultGenerate() {
  y0Default = height-scale_size*1.5-100;
}


//Opgaven bliver defineret. 
void opgave() {
  for (int i = 0; i < SliderListe.length; i++) {
    SliderListe[i].locked = false;
  }

  int task = (int) random(0, 3);

  float value = 0;

  SliderListe[task].locked = true;
  SliderListe[task].nulstillet = false;

  if (SliderListe[task].label == "v0") {
    value = round((int) random(150, 300))*0.1;
    SliderListe[task].val = value;
    v0 = value;
  }

  if (SliderListe[task].label == "alpha") {
    value = round((int) random(100, 800))*0.1;
    SliderListe[task].val = value;

    alpha = radians(-value);
    SliderListe[task].locked = true;
  }

  if (SliderListe[task].label == "y0") {
    value = round((int) random(10*SliderListe[task].steps))*0.1;
    SliderListe[task].val = value;
    y0 = y0Default-scale_size*value; //y0 er mellem y0default og
  }

}
