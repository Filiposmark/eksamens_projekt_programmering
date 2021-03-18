


class Sky {    //Laver klassen sky

  int elements = 20;
  float sum;
  float[] posxlist = new float[elements];
  float[] posylist = new float[elements];
  float[] radiuslist = new float[elements];
  

  float posx, posy;
  
  //Skyen bliver initialiseret på sin givne position
  Sky(float posx, float posy) {
    this.posx = posx;
    this.posy = posy+random(-50, 200);
    
  }
  
  //De enkelte elementer af skyen bliver lavet random indenfor en rimlig afstand fra hinanden.
  void setup_sky() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] = posx+random(-30, 30);
      posylist[i] = posy+random(-20, 20);
      radiuslist[i] = random(50, 80);
    }
  }
  
  //Skyen bliver samlet

  void makeSky() {

    for (int i = 0; i < posylist.length; i++) {
      fill(255);
      circle(posxlist[i], posylist[i], radiuslist[i]);
    }
  }

  float sky_size() {
    for (int i = 0; i < posxlist.length; i++) {
      sum += radiuslist[i];
    }
    return sum;
  }

  //Skyen bevæger sig ved at lægge til på skyens x-position
  void moveSky() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] += sum * 0.001;
    }
  }
  
  //Hvis skyen er lidt over bredden af skærmen, bliver den sat tilbage til lidt før skærmen, med en lidt ny y-position.
  void collision() {
    if (posxlist[0] > 2000) {
      for (int i = 0; i < posxlist.length; i++) {
        posxlist[i] += -2200;
      }
      posy = posy+random(-50, 200);
    }
  }
}



class Tree {  //Laver klassen Tree

  float x, y;

  int elements = 20;
  float sum; 
  float sticklen = random(40,80);
  float[] posxlist = new float[elements];
  float[] posylist = new float[elements];
  float[] radiuslist = new float[elements];

  Tree(float x, float y) {
    this.x = x;
    this.y = y;
  }

  //trækronens elementer bliver sat op
  void setup_crown() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] = x + random(-30, 30);
      posylist[i] = y + random(-20, 20);
      radiuslist[i] = random(50, 80);
    }
  }
  
  //Træstammen bliver sat op
  
  void make_trunk() {
    fill(101,67,33);
    rect(x,y,20,250);
    
    pushMatrix();
    translate(x,y);
    translate(0,200);
    rotate(-(PI/3));
    rect(0,0,sticklen,10);
    popMatrix();
    
    pushMatrix();
    translate(x,y);
    translate(0,100);
    rotate(PI/3);
    rect(20,0,-sticklen,10);
    popMatrix();
    
    
    
    
  }
  
  //Trækronen bliver samlet

  void make_crown() {

    for (int i = 0; i < posylist.length; i++) {
      fill(0,155,0);
      circle(posxlist[i], posylist[i], radiuslist[i]);
    }
  }
}
