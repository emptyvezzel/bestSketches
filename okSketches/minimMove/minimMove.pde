import ddf.minim.*;
Minim minim;
AudioInput in;

float theta;
int frms = 480;
int sw = 5;
int step = 8;
int offSet = 0;
float vari = 1.0;
float soundAdj = 50;

void setup() {
  size(1000, 1000);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  background(238, 238, 238);
  stroke(34, 34, 34);
  //strokeWeight(sw);
  frms = 480;
  sw = 1;
  step = 6;
  offSet = 0;
  vari = 1.0;
  soundAdj = 126;
  
  float sz = map(sin(theta), -1, 1, width*.1, width*0.8);

  for (int x = offSet; x< width-offSet+1; x += step) {
    //float off = map(x, 0, width, 0, TWO_PI);
    strokeWeight(abs(sw + in.left.get(x)*soundAdj));
    if (x> width/2-sz/2.0 && x< width/2+sz/2) {
      float angle = asin((x-width/2)/(sz/2));
      float y = height/2 + cos(angle+PI)*sz*.5;
      line(x, offSet*vari, x, y);
    } else {
      line(x, offSet*vari, x, height-offSet);
    }
  }
  fill(225, 76, 69);
  noStroke();
  ellipse(width/2, height/2, sz*0.9, sz*0.9);
  theta += TWO_PI/frms;
}
