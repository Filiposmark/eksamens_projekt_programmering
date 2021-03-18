

float time; //i sekunder
float gravity =-9.82; //tyngdeaccelerationen på Jorden i m/s^2

float ballx(float time) {
  return time*ScaleHastighed(v0, scale_size)*cos(-alpha); //skuddets position i x-retningen er kun bestemt af begyndelseshastighed (ingen luftmodstand). Cosinus fordi v0 er længden af en vektor
}

float bally(float time) {
  return y0-time*ScaleHastighed(v0, scale_size)*sin(-alpha) - (0.5*gravity*scale_size)*sq(time); //Skuddets position i y-retningen. Bestemt af v0's y-komposant fratrukket tyngdeaccelerationen. Fysikformel
}

//gemmer den aktuelle frame
int get_frame() {
  return frameCount;
}

//tegner skuddet
void shoot() {
  fill(0);
  circle(x0+ballx(time), bally(time),scale_size*0.2); //Dets størrelse er 20cm og x-positionen måles fra x0.
}
