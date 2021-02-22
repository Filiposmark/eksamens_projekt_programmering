
class Confetti {
  float x,y, angle;
  int lifespan = 255;
  PVector location, velocity, acceleration;
  color color_;
  float anglevel = 0.1; 
  Confetti(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(-1,1), random(-1,1));
    acceleration = new PVector(0,1);
    color_ = color(random(50,200),random(50,200),random(50,200), lifespan);
  }
  
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
  
  void move() {
    velocity.add(acceleration);
    acceleration.limit(3);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
  }
  
  
    
}
