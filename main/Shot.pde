

float time;
float gravity =-9.82;

float ballx(float time) {
  return time*xHastighed(v0, scale_size)*cos(-alpha);
}

float bally(float time) {
  return y0-time*yHastighed(v0, scale_size)*sin(-alpha) - (0.5*gravity*scale_size)*sq(time);
}

int get_frame() {
  return frameCount;
}


void shoot() {
  
  fill(0);
  circle(x0+ballx(time), bally(time),20);
  //println(ballx(time, 10, 45), bally(time, 10, 300));
}
