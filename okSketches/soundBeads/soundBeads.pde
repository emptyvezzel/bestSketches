color [] colors;
float [][] cirVar = new float [10000][10000];
int shapeSize = 5;
color c0 = #F04248;
color c1 = #FFADBA;
color c2 = #FFFF31;
color c3 = #3A86FF;
color c4 = #269464;
int backTrue = 0;
int size = 1;
int spread = 5;
float counter = 0;
float scale = 5; 
float range;
float n;
float scroll = 1;
float colVal;
float changeVar = 0;
float lerpInc = 0.00;
float rangeUp = 0;

//minim
import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity;

void setup() {
  size(1000, 1000);
  noStroke();
  //fullScreen();
  background(0);
  colorMode(HSB, 365, 100, 100);
  generateCols();
  minim = new Minim(this);
  in = minim.getLineIn();
  for (int j = 0; j < height/shapeSize+1; j++) {
    for (int i = 0; i < width/shapeSize+1; i++) {
      cirVar[i][j] = random(0, 1);
    }
  }
}

void draw() {
  changeVar += 0.005;
  shapeSize = 5;
  //background(0);
  sensitivity = 500;
  counter += 0.010;
  size = 1;
  lerpInc += 0.001;
  for (int j = 0; j < height/shapeSize+1; j++) {
    for (int i = 0; i < width/shapeSize+1; i++) {
      colVal = (j+cirVar[i][j]+changeVar)%5;
      lerpInc = changeVar%1;
      if (colVal > 0 && colVal < 1) fill(lerpColor(c0, c1, lerpInc));
      if (colVal > 1 && colVal < 2) fill(lerpColor(c1, c2, lerpInc));
      if (colVal > 2 && colVal < 3) fill(lerpColor(c2, c3, lerpInc));
      if (colVal > 3 && colVal < 4) fill(lerpColor(c3, c4, lerpInc));
      if (colVal > 4) fill(lerpColor(c4, c0, lerpInc));
      ellipse(i*shapeSize, j*shapeSize + in.left.get((i%1024)*shapeSize)*sensitivity, shapeSize, shapeSize);
    }
  }
}

void generateCols() {
  noStroke();
  colors = new color[37];
  for (int i=0; i<colors.length; i++) {
    colors[i] = color(random(255), random(150), random(150));
  }
}

void keyPressed(){
  generateNewPallet();
}

void generateNewPallet() {
  c0 = color(random(0, 255), random(0, 255), random(0, 255));
  c1 = color(random(0, 255), random(0, 255), random(0, 255));
  c2 = color(random(0, 255), random(0, 255), random(0, 255));
  c3 = color(random(0, 255), random(0, 255), random(0, 255));
  c4 = color(random(0, 255), random(0, 255), random(0, 255));
}
