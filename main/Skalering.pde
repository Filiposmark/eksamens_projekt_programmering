

//funktion som laver skaleringsfaktor. ganges på enhed i meter for at få størrelsen i pixels.
float Skalering(float xSlut){

  float sFaktor = width/(xSlut + 4); //pixels per meter. baseret på xSlut. Der lægges 4 meter til xSlut, da der er 2 meter kanonen til siden og fra målet til siden.
  
  return sFaktor;
}

//funktion som omregner hastighed fra m/s til pixels per sekund
float ScaleHastighed (float vIN, float skaleringsfaktor) {
  
  float v = (vIN * skaleringsfaktor); //pixels per sekund
  
  return v;
}
