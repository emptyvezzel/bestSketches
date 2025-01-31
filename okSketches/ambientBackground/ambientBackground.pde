int rects = 10;
float[] startX = new float[rects];
float[] startY = new float[rects];
float[] speed = new float[rects];
float[] directionX = new float[rects];
float[] directionY = new float[rects];
float[] sizeX = new float[rects];
float[] sizeY = new float[rects];
float[] startVal = new float[rects];
float colVal;
float soundVal = 0;
float[] changeVar = new float[rects];
float lerpInc = 0.00;
color c0 = #F04248;
color c1 = #FFADBA;
color c2 = #FFFF31;
color c3 = #3A86FF;
color c4 = #269464;
//color[] c0 = new color[rects];
//color[] c1 = new color[rects];
//color[] c2 = new color[rects];
//color[] c3 = new color[rects];
//color[] c4 = new color[rects];
import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity;

void setup(){
  size(1000, 1000);
  noStroke();
  fullReset();
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  sensitivity = 200;
  for(int i = 0; i < rects; i++){
    changeVar[i] += 0.005;
    lerpInc += 0.001;
    colVal = changeVar[i]%5;
    lerpInc = changeVar[i]%1;
    if (lerpInc > 1)lerpInc = 0;
    if (colVal > 0 && colVal < 1) fill(lerpColor(c0, c1, lerpInc));
    if (colVal > 1 && colVal < 2) fill(lerpColor(c1, c2, lerpInc));
    if (colVal > 2 && colVal < 3) fill(lerpColor(c2, c3, lerpInc));
    if (colVal > 3 && colVal < 4) fill(lerpColor(c3, c4, lerpInc));
    if (colVal > 4) fill(lerpColor(c4, c0, lerpInc));
    //if (lerpInc > 1)lerpInc = 0;
    //if (colVal > 0 && colVal < 1) fill(lerpColor(c0[i], c1[i], lerpInc));
    //if (colVal > 1 && colVal < 2) fill(lerpColor(c1[i], c2[i], lerpInc));
    //if (colVal > 2 && colVal < 3) fill(lerpColor(c2[i], c3[i], lerpInc));
    //if (colVal > 3 && colVal < 4) fill(lerpColor(c3[i], c4[i], lerpInc));
    //if (colVal > 4) fill(lerpColor(c4[i], c0[i], lerpInc));
    //fill(random(0, 255), random(0, 255), random(0, 255));
    soundVal = in.left.get(abs(i%1024))*sensitivity;
    rect(startX[i], startY[i], sizeX[i]+soundVal, sizeY[i]+soundVal);
    startX[i] -= speed[i]*directionX[i];
    startY[i] -= speed[i]*directionY[i];
    if(startX[i] < 0 || startX[i] > (width - sizeX[i])) directionX[i]*=-1;
    if(startY[i] < 0 || startY[i] > (height - sizeY[i])) directionY[i]*=-1;
  }
}

void randCols(){
  for(int i = 0; i < rects; i++){
    changeVar[i] = random(0, 5);
    //c0[i] = color(random(0, 255), random(0, 255), random(0, 255));
    //c1[i] = color(random(0, 255), random(0, 255), random(0, 255));
    //c2[i] = color(random(0, 255), random(0, 255), random(0, 255));
    //c3[i] = color(random(0, 255), random(0, 255), random(0, 255));
    //c4[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
}

void fullReset(){
  background(0);
  randCols();
  newPositionsAndSizes();
}

void newPositionsAndSizes(){
  for(int i = 0; i < rects; i++){
    speed[i] = random(0.1, 5);
    sizeX[i] = random(50, 200);
    sizeY[i] = random(50, 200);
    startX[i] = random(0, width-sizeX[i]);
    startY[i] = random(0, height-sizeX[i]);
    directionX[i] = random(-5, 5);
    directionY[i] = random(-5, 5);
  }
}
