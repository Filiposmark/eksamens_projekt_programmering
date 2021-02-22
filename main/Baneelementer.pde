
class Sky {

  int elements = 20;
  float sum;
  float[] posxlist = new float[elements];
  float[] posylist = new float[elements];
  float[] radiuslist = new float[elements];
  

  float posx, posy;

  Sky(float posx, float posy) {
    this.posx = posx;
    this.posy = posy+random(-50, 200);
    
  }

  void setup_sky() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] = posx+random(-30, 30);
      posylist[i] = posy+random(-20, 20);
      radiuslist[i] = random(50, 80);
    }
  }

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

  void moveSky() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] += sum * 0.001;
    }
  }

  void collision() {
    if (posxlist[0] > 2000) {
      for (int i = 0; i < posxlist.length; i++) {
        posxlist[i] += -2200;
      }
      posy = posy+random(-50, 200);
    }
  }
}

class Tree {

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

  void setup_crown() {
    for (int i = 0; i < posxlist.length; i++) {
      posxlist[i] = x + random(-30, 30);
      posylist[i] = y + random(-20, 20);
      radiuslist[i] = random(50, 80);
    }
  }
  
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

  void make_crown() {

    for (int i = 0; i < posylist.length; i++) {
      fill(0,155,0);
      circle(posxlist[i], posylist[i], radiuslist[i]);
    }
  }
  
  

  class Waterfall {
    
  }
}
