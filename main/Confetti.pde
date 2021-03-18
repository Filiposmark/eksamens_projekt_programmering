
class Confetti { //Laver klassen Confetti
  float x,y, angle;
  int lifespan = 255;
  PVector location, velocity, acceleration;
  color color_;
  float anglevel = 0.1; 
  
  //Confetti constructor
  Confetti(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(-2,2), random(-0.5,2));
    acceleration = new PVector(random(-1,1),random(-1,1));
    color_ = color(random(50,200),random(50,200),random(50,200), lifespan);
  }
  
  //Confetti bliver vist
  
  void display() {
    
    color_ = color(random(155,255),random(155,255),random(155,255), lifespan);
    fill(color_);
    
    pushMatrix();
    translate(location.x,location.y);
    
    angle += anglevel;
    rotate(angle);
    rect(-10,-5,20,10);
    popMatrix();
  }
  
  //Confettiens bevægelse. Confettien dør langsomt hen, i takt med dens gennemsigtighed
  
  void move() {
    velocity.add(acceleration);
    acceleration.limit(3);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
  }
  
  
    
}
