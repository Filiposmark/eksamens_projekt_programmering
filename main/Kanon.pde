

float scale_size = 200;

int Ballx0 = 500;
int Bally0 = 500;
float BallSize = scale_size * 0.3;


float kanonX = -(scale_size*0.5)+BallSize/2;
float kanonY = 0;
float kanonWidth = scale_size * 1.5;
float kanonHeight = scale_size * 0.4;




void DrawKanon() {
  Float PoleWidth = scale_size*0.25;
  float PoleY = height-y0-(sin(radians(-alpha))*(kanonWidth*0.5-BallSize));
  float PoleHeight = ((height-y0+scale_size*2)-scale_size*0.5) - PoleY;
  float PoleX = Ballx0-(cos(radians(-alpha))*(kanonWidth*0.5-BallSize))-PoleWidth/2;


  pushMatrix();

  translate(Ballx0, height-y0);
  
  rotate(radians(-alpha));

  rectMode(CENTER);

  fill(51, 50, 55);
  noStroke();
  rect(kanonX, kanonY, kanonWidth, kanonHeight);
  ellipse(kanonX-(kanonWidth/2)-(scale_size*0.05), kanonY, scale_size * 0.15, scale_size * 0.15);

  popMatrix();
  
  pushMatrix();
  fill(103, 40, 51);
  rectMode(CORNER);
  rect(PoleX, PoleY, PoleWidth, PoleHeight);
 
  rect(PoleX+(PoleWidth/2)-(scale_size*0.6), (height-y0+scale_size*2)-scale_size*0.7, scale_size*1.2, scale_size*0.2);
  stroke(2);
  ellipse(PoleX+(PoleWidth/2)-(scale_size*0.5), (height-y0+scale_size*2)-scale_size*0.6, scale_size * 0.35, scale_size * 0.35);
  ellipse(PoleX+(PoleWidth/2)+(scale_size*0.5), (height-y0+scale_size*2)-scale_size*0.6, scale_size * 0.35, scale_size * 0.35);

  popMatrix();
}


void keyPressed() {
  if (keyCode == UP) {
    alpha -= radians(1);
  } else if (keyCode == DOWN) {
    alpha += radians(1);
  }
}
