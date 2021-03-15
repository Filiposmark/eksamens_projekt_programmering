


float Skalering(float xSlut){

  float sFaktor = width/(xSlut + 4); //pixels per meter
  
  return sFaktor;
}


float xHastighed (float v0xIN, float skaleringsfaktor) {
  
  float v0x = (v0xIN * skaleringsfaktor); //pixels per sekund
  
  return v0x;
}



float yHastighed (float v0yIN, float skaleringsfaktor) {
  
   float v0y = (v0yIN * skaleringsfaktor); //pixels per sekund
  
  return v0y;
}
