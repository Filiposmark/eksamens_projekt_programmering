


float Skalering(float xSlut){

  float sFaktor = width/(xSlut + 4);
  
  return sFaktor;
}


float xHastighed (float v0xIN, float skaleringsfaktor) {
  
  float v0x = (v0xIN * skaleringsfaktor);
  
  return v0x;
}

float yHastighed (float v0yIN, float skaleringsfaktor) {
  
   float v0y = (v0yIN * skaleringsfaktor);
  
  return v0y;
}
