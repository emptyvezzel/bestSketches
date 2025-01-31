import ddf.minim.*;
Minim minim;
AudioInput in;
int size = 1;
int sensitivity = 50;
float yPos = height/2;
int dir = 1;
int speed = 1;
int backTrue = 0;
float colToggle = 0;
float lerpInc = 0.00;
float changeVar = 0.00;
color c0 = #F04248;
color c1 = #FFADBA;
color c2 = #FFFF31;
color c3 = #3A86FF;
color c4 = #269464;
color lineStroke;

void setup() {
  size(2000, 1000);
  background(0);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  if(backTrue % 2 == 0) background(0);
  lerpInc += 0.0022;
  //changeVar += 0.005;
  //colVal = changeVar%5;
  if (lerpInc > 1) {
    lerpInc = 0;
    colToggle++;
  }
  if (colToggle > 4) colToggle = 0;
  if (colToggle == 0) lineStroke = lerpColor(c0, c1, lerpInc);
  if (colToggle == 1) lineStroke = lerpColor(c1, c2, lerpInc);
  if (colToggle == 2) lineStroke = lerpColor(c2, c3, lerpInc);
  if (colToggle == 3) lineStroke = lerpColor(c3, c4, lerpInc);
  if (colToggle == 4) lineStroke = lerpColor(c4, c0, lerpInc);
  stroke(lineStroke); //<>//
  //stroke(color(#F04248));
  size = 10;
  sensitivity = 500;
  speed = 6;
  for(int i = 0; i < width - 1; i++) {
    line(i, yPos + size + in.left.get(i/3)*sensitivity,
    i+1, yPos - size + in.left.get(i/3+1)*sensitivity);
  }
  yPos += speed*dir;
  if(yPos+(size/2) > height || yPos - (size/2) < 0) dir*=-1;
}

void keyPressed(){
  if(key == ' ') backTrue++;
  if (key == 'b') generateNewPallet();
}

void generateNewPallet() {
  c0 = color(random(0, 255), random(0, 255), 255);
  c1 = color(random(0, 255), random(0, 255), 255);
  c2 = color(random(0, 255), random(0, 255), 255);
  c3 = color(random(0, 255), random(0, 255), 255);
  c4 = color(random(0, 255), random(0, 255), 255);
}
