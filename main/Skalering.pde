



float Skalering(float xSlut){

  float sFaktor = width/(xSlut + 2);
  
  return sFaktor;
}


float xHastighed (float v0xIN, float skaleringsfaktor) {
  
  float v0x = (v0xIN * skaleringsfaktor) / 60;
  
  return v0x;
}



float yHastighed (float v0yIN, float skaleringsfaktor) {
  
   float v0y = (v0yIN * skaleringsfaktor) / 60;
  
  return v0y;
}
