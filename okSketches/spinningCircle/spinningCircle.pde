int iLimit;

void setup(){
  //size(800, 800);
  fullScreen();
}

void draw(){
  background(0);
  iLimit = 80;
  stroke(255);
  noFill();
  shapeMode(CENTER);
  strokeWeight(2.5);
  translate(width/2, height/2);
  rotate(radians(frameCount*10.0));
  for(int i = 0; i < iLimit; i++){
    if(i <= iLimit/4)
      ellipse(0+i*3.0, 0, 10*i, 10*i);
    else if(i <= iLimit/2)
      ellipse(123+i*-3.0, 0, 10*i, 10*i);
    else if(i <= iLimit*3/4)
      ellipse(-123+i*3.0, 0, 10*i, 10*i);
    else
      ellipse(237+i*-3.0, 0, 10*i, 10*i);
  }
}
