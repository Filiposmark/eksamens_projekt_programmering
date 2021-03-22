
float BallSize = scale_size * 0.2;

void DrawKanon() {
  
  float kanonX = -(scale_size*0.5)+BallSize/2;
  float kanonY = 0;
  float kanonWidth = scale_size * 1.5;
  float kanonHeight = scale_size * 0.4;

  Float PoleWidth = scale_size*0.25;
  float PoleY = y0-(sin(alpha)*(kanonWidth*0.5-BallSize));
  float PoleHeight = (y0+scale_size*1.5) - PoleY;
  float PoleX = x0-(cos(-alpha)*(kanonWidth*0.5-BallSize))-PoleWidth/2;


  pushMatrix(); //tegner kanonløb

  translate(x0, y0);

  rotate(alpha);

  rectMode(CENTER);

  fill(51, 50, 55);
  noStroke();
  rect(kanonX, kanonY, kanonWidth, kanonHeight);
  ellipse(kanonX-(kanonWidth/2)-(scale_size*0.05), kanonY, scale_size * 0.15, scale_size * 0.15);

  popMatrix();

  pushMatrix();    //tegner kanonfod
  fill(103, 40, 51);
  rectMode(CORNER);
  rect(PoleX, PoleY, PoleWidth, PoleHeight);

  rect(PoleX+(PoleWidth/2)-(scale_size*0.6), (y0+scale_size*2)-scale_size*0.7, scale_size*1.2, scale_size*0.2);
  stroke(2);
  circle(PoleX+(PoleWidth/2)-(scale_size*0.5), (y0+scale_size*2)-scale_size*0.6, scale_size * 0.35);
  circle(PoleX+(PoleWidth/2)+(scale_size*0.5), (y0+scale_size*2)-scale_size*0.6, scale_size * 0.35);
  
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(130, 90, 60);
  rect(0, (y0+scale_size*2)-scale_size*0.6+scale_size * 0.35*0.5, x0+scale_size*0.6, height); //tegner kanonens platform.
  stroke(1);
  popMatrix();
  
  
}
