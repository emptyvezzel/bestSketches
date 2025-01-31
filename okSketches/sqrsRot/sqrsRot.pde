float angle;
float colMod;
float sizeScale = 2;
int sqrs;
int bgrToggle = 0;
int colorToggle = 0;

//lerp
int lerpToggle;
float lerpVal = 0;
float lerpInc = 0.01;
color col;
color col0 = #DC3522;
color col1 = #D9CB9E;
color col2 = #374140;
color col3 = #2A2C2B;
color col4 = #1E1E20;

//minim
import ddf.minim.*;
Minim minim;
AudioInput in;
float adj = 50;
 
void setup(){
  colorMode(HSB);
  size(1900,1000);
  //fullScreen(); 
  genCols();
  minim = new Minim(this);
  in = minim.getLineIn();
}
 
void draw(){
  if(bgrToggle % 2 == 0) background(0);
  angle += 0.0002;
  adj = 100;
  strokeWeight(100);
  noFill();
  translate(width/2,height/2);
  sqrs = 350;
  sizeScale = 1.0;
  for (int i = 0; i < sqrs; i++){
    if(colorToggle % 2 == 0) {
      colorMode(HSB);
      stroke(i*colMod%255, 255, 255);
    } else {
      colorMode(RGB);
      lerpInc = 0.000009;
      lerpVal += lerpInc;
      if (lerpVal > 1) {
        lerpVal = 0;
        lerpToggle++;
      }
      lerpToggle = lerpToggle + i;
      if (lerpToggle % 5 == 0) col = lerpColor(col0, col1, lerpVal);
      if (lerpToggle % 5 == 1) col = lerpColor(col1, col2, lerpVal);
      if (lerpToggle % 5 == 2) col = lerpColor(col2, col3, lerpVal);
      if (lerpToggle % 5 == 3) col = lerpColor(col3, col4, lerpVal);
      if (lerpToggle % 5 == 4) col = lerpColor(col4, col0, lerpVal);
      stroke(col);
    }
    rotate(angle);
    scale(0.97);
    rectMode(CENTER);
    rect(0,0,width*sizeScale + in.left.get(i%1024)*adj,height*sizeScale + in.left.get(i%1024)*adj);
  }
  colMod += 0.01;
}

void keyPressed(){
  if(key == ' ') bgrToggle++;
  if(key == 'f') colorToggle++;
  if(key == 'g') genCols();
}

void genCols(){
  col0 = color(random(0, 255), random(0, 255), random(0, 255));
  col1 = color(random(0, 255), random(0, 255), random(0, 255));
  col2 = color(random(0, 255), random(0, 255), random(0, 255));
  col3 = color(random(0, 255), random(0, 255), random(0, 255));
  col4 = color(random(0, 255), random(0, 255), random(0, 255));
}
