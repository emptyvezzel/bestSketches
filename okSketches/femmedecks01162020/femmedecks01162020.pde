
//general variables
import ddf.minim.*;
Minim minim;
AudioInput in;
int sketchNum;
int blankTrue = 1;

//sketch 0: beanGrid
float lineSize;
double randVar;
double colRand;
int colRand0;
int[][] beans;
int x;
int y;

//sketch 1: triangleAnimation
float triSize = 50;
float triAdd =  0.00;
float soundVar;
float radianVar = 0;
int triAmt = 1;
int phaseNum = 0;

//sketch 2: waveCircle
WaveCircle circ1, circ2;
float inc = 0.01;
float circSize = 100;
float distortSize = 1.0;
int freq = 20;
float equaDist = 100;
int sensitivity = 10;
float z = 0;
float s = 0;
float waveSize = 1.0;
float growVar = 0.01;
boolean waveGrow = true;

//sketch 3: rotDown
float size = 0;
float xPos = 2;
float armVar = 8;
int rotVal = 0;

//sketch 4: waveOrb
float speed = 0.2;
float radius;
float divisor = 13;
float divisorChange;
int incDivisor = 1;

//sketch 5: sineCircle
float rotVar = 0.0;
float radius0 = 20;
float angle = 0;
float dx;
float dy;
float freq0 = 0;
float amp = 3.0;
float ampIncSpeed;
float period;
int pixelNum = 0;
int ampInc = 0;
int xSize;
int ySize;
int incVar = 1;
float incSpeed = 0.10;

//sketch 6: sweaterLines
int size0 = 100;
int xPos0 = 0;
float weight0 = 50;
float speed0 = 0.1;

//sketch 7: treeTest
float proportion = 1;
int stayVar = 1;
int xStart;
int yStart;
float xGrowth = 0;
float yGrowth = 0;
int xChange = 0;
int yChange = 100;
float newRandomX;
float newRandomY;
float finalX;
float finalY;
float growSpeed;
int swayVar = 0;
float swaySpeed = 10.0;
boolean check0 = false;
boolean check1 = false;
boolean check2 = false;
boolean check3 = false;
int backgroundVar = 1;

void setup() {
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn();
  circ1 = new WaveCircle();
  circ2 = new WaveCircle();
  smooth();
  finalX = generate1000sX();
  finalY = generate1000sY();
}

void draw() {
  noCursor();
  if (frameCount % 18000 == 0) sketchNum++;
  if (sketchNum >= 8) sketchNum = 0;
  if (sketchNum < 0) sketchNum = 7;
  if (sketchNum == 0) { //beanGrid
    colorMode(RGB);
    triAmt = 1;
    strokeWeight(abs(lineSize * 0.50 + in.left.get(1)*100));
    lineSize = abs(42);
    translate(-lineSize, -lineSize);
    if (frameCount % 5 == 0) generateLines();
  }
  if (sketchNum == 1) { //triangleAnimation
    background(0);
    noFill();
    triSize = 500;
    triAdd += 3.22;
    stroke(255);
    strokeWeight(6.0);
    translate(width/2, height/2);
    soundVar = abs(in.left.get(1)*802);
    for (int j = 0; j < triAmt; j++) {
      pushMatrix();
      rotate(radians(j*radianVar));
      triangle(0, -triSize - soundVar, -triSize - soundVar, triSize + soundVar, triSize + soundVar, triSize + soundVar);
      strokeWeight(2.0);
      for (int i = 0; i < 20; i++) {
        triangle(0, -triSize+i*50+triAdd - soundVar, -triSize - soundVar, triSize + soundVar, triSize + soundVar, triSize + soundVar);
      }
      if (triAdd >= 51.0) triAdd = 0;
      popMatrix();
    }
    radianVar++;
    if (radianVar % 360 == 0) triAmt++;
  }
  if (sketchNum == 2) { //waveCircle
    triAmt = 1;
    translate(350, -40);
    inc = 0.01;
    circSize = 300;
    distortSize = 1.0;
    freq = 13;
    strokeWeight(2);
    s += 0.010;
    float speed = 0.04;
    z += speed;
    if (z >= TWO_PI) z-= TWO_PI;
    clear();
    sensitivity = 1000;
    strokeWeight(3.0);
    equaDist = in.left.get(1)*sensitivity;
    for (int i = 0; i < 3; i++) {
      if (i == 0) {
        pushMatrix();
        stroke(255, 0, 0);
        translate(equaDist, 0);
      }
      if (i == 1) {
        pushMatrix();
        stroke(0, 0, 255);
        translate(-equaDist, 0);
      }
      if (i == 2) stroke(255);
      circ1.draw(z, 2);
      circ2.draw(z+1.0, -1);
      if (i == 0) {
        popMatrix();
      }
      if (i == 1) {
        popMatrix();
      }
    }
  }
  if (sketchNum == 3) { //rotDown
    size = 2.0;
    armVar = 360.0;
    noStroke();
    translate(width/2, height/2);
    background(0);
    rotate(radians(rotVal));
    sensitivity = 1000;
    for (int j = 0; j < 62; j++) {
      for (int i = 0; i < armVar; i++) {
        pushMatrix();
        rotate(radians(360/armVar * i));
        ellipse(xPos + in.left.get(i*2)*sensitivity, + in.left.get(i)*sensitivity, size, size);
        popMatrix();
      }
      xPos += j*0.6;
      fill(0+j*5, 255, j*17);
    }
    xPos = 2.0;
    rotVal++;
  }
  if (sketchNum == 4) { //waveOrb
    strokeWeight(1.0);
    speed += 0.20;
    sensitivity = 300;
    divisorChange = 0.010;
    divisor -= divisorChange*incDivisor;
    if (divisor == 0) divisor = 1;
    background(0);
    stroke(255);
    translate(width/2, height/2);
    noFill();
    radius = height/2-20;
    for (float i =- 0.5*PI; i<PI+0.5*PI; i += abs(0.01)*PI) {
      beginShape();
      for (float j =- sin(i)*radius; j < sin(i)*radius+sin(i); j += sin(i)*20) {
        float divisorResult = j/divisor;
        curveVertex(j, cos(i)*radius+sin(speed-(divisorResult))*abs(i*4+abs(in.left.get(Math.round(i))*sensitivity)));
      }
      endShape();
    }
    if (divisor < 0.1) incDivisor = -1;
    if (divisor > 13.0) incDivisor = 1;
  }
  if (sketchNum == 5) { //sineCircle
    translate(width/2, height/2);
    freq0 += incSpeed*incVar;
    ampIncSpeed = 5.27;
    period = 0.0053;
    xSize = 2;
    ySize = 2;
    if (period <= 0.005) period = 0.005;
    noStroke();
    rotate(rotVar);
    background(0);
    for (int i = 0; i < 80; i++) {
      radius0 = 18*i+in.left.get(i*3)*1119;
      for (float angle = 0; angle <= TWO_PI; angle += period) {
        if (i % 3 == 0) fill(0, 255, 0);
        if (i % 3 == 1) fill(255, 0, 0);
        if (i % 3 == 2) fill(0, 0, 255);
        dx = (radius0 + sin(angle * freq0) * amp) * cos(angle);
        dy = (radius0 + sin(angle * freq0) * amp) * sin(angle);
        rect(dx, dy, xSize, ySize);
        pixelNum++;
      }
    }
    rotVar += 0.004;
    if (amp <= -500) ampInc++;
    if (amp > 500) ampInc++;
    if (ampInc % 2 == 0) amp += ampIncSpeed;
    else amp -= ampIncSpeed;
    if (xSize > 3 || ySize > 3) rotVar = 0;
    if (freq0 > 20) incVar *= -1;
    if (freq0 < -20) incVar *= -1;
  }
  if (sketchNum == 6) { //sweaterLines
    background(0);
    strokeCap(PROJECT);
    if (weight0 < 3) speed0 *= -1;
    if (weight0 > 80) speed0 *= -1;
    weight0 += speed0;
    strokeWeight(weight0);
    for (int j = 0; j - 1 < height/weight0; j++) {
      if (j % 5 == 0) stroke(#073138);
      if (j % 5 == 1) stroke(#29B2A4);
      if (j % 5 == 2) stroke(#FFDEAD);
      if (j % 5 == 3) stroke(#FFDE4D);
      if (j % 5 == 4) stroke(#FF9060);
      for (int i = 0; i < in.bufferSize() - 1; i++) {
        line(i*2, weight0*j + in.left.get(i)*600, i*2+1, weight0*j + in.left.get(i+1)*600);
      }
    }
  }
  if (sketchNum == 7) {
    translate(width/2, height+310);
    if (frameCount % 600 == 0) backgroundVar++;
    if (backgroundVar % 2 == 0) background(0);
    strokeWeight(10);
    swaySpeed = 11.6;
    growSpeed = 8.84;
    if (yChange > height) yChange = 100;
    proportion = in.left.get(348)*50;
    F(600);
    stroke(255);
    tree(2, 15, 300, proportion, map(yGrowth, 0, height, 0, 90), map(xGrowth, 0, width, 60, -60));
    System.out.println("xGrowth: " + xGrowth + "\nyGrowth: " + yGrowth);
    if (yGrowth < finalY) { 
      yGrowth += growSpeed;
      check1 = true;
    } else check0 = true;
    if (yGrowth > finalY) {
      yGrowth -= growSpeed;
      check0 = true;
    } else check1 = true;
    if (xGrowth < finalX) {
      xGrowth += growSpeed;
      check3 = true;
    } else check2 = true;
    if (xGrowth > finalX) {
      xGrowth -= growSpeed;
      check2 = true;
    } else check3 = true;
    if (check0 == true && check1 == true && check2 == true && check3 == true) {
      finalX = generate1000sX();
      finalY = generate1000sY();
      check0 = false;
      check1 = false;
      check2 = false;
      check3 = false;
    }
  }
  if (blankTrue % 3 == 0) background(0);
} 

//method for beanGrid
void generateLines() {
  x = Math.round(width/lineSize);
  y = Math.round(height/lineSize);
  beans = new int[x+2][y+2];
  strokeCap(PROJECT);
  background(0);
  for (int i = 0; i < width/lineSize+1; i++) {
    for (int j = 0; j < height/lineSize+1; j++) {
      colRand0 = (int) random(0, 255);
      colRand = Math.random();
      randVar = Math.random();
      if (colRand > 0) stroke(0, 184, 146);
      if (colRand > 0.25) stroke(21, 140, 240);
      if (colRand > 0.5) stroke(253, 136, 118);
      if (colRand > 0.75) stroke(253, 250, 133);
      if (j == 0 || i == 0) {
        if (randVar > 0.5) {
          line(lineSize*i, lineSize*j, lineSize+lineSize*i, lineSize+lineSize*j);
          beans[i][j] = 0;
        } else {
          line(lineSize*i, lineSize+lineSize*j, lineSize+lineSize*i, lineSize*j);
          beans[i][j] = 1;
        }
      } else {
        if (beans[i][j] == 0 && beans[i][j-1] == 0 && beans[i-1][j-1] == 1) {
          line(lineSize*i, lineSize*j, lineSize+lineSize*i, lineSize+lineSize*j);
          beans[i][j] = 0;
        } else {
          if (randVar > 0.5) {
            line(lineSize*i, lineSize*j, lineSize+lineSize*i, lineSize+lineSize*j);
            beans[i][j] = 0;
          } else {
            line(lineSize*i, lineSize+lineSize*j, lineSize+lineSize*i, lineSize*j);
            beans[i][j] = 1;
          }
        }
      }
    }
  }
}

//for waveCircle
float radDist(float t1, float t2) {
  while (t1>=TWO_PI) t1-= TWO_PI;
  while (t1<0) t1 += TWO_PI;
  while (t2>=TWO_PI) t2-= TWO_PI;
  while (t2<0) t2 += TWO_PI;
  float d = abs(t1-t2);
  if (d>=PI) {
    d = PI-(d-PI);
  }
  return d;
}

//also for waveCircle
class WaveCircle {
  void draw(float z, float q) {
    pushMatrix();
    noFill();
    beginShape();
    growVar = 0.01;
    if (waveSize <= 0.01) waveGrow = true;
    if (waveSize >= 9.0) waveGrow = false;
    if (waveGrow == true) waveSize += growVar;
    else waveSize -= growVar;
    translate(2*circSize, 2*circSize);
    for (float i = 0; i <= TWO_PI; i+=inc) {
      float rad = circSize;
      float dist  = pow(radDist(i, z), waveSize);
      rad += q*distortSize*dist*sin(i*freq);
      vertex(rad*sin(i+s), rad*cos(i+s));
    }
    endShape();
    popMatrix();
  }
}

//methods for treeTest
void tree(int level, int max, float scale, float proportion, float angle, float deviation) {
  level+=1;
  scale *= 0.7000;
  if (level < max - 0) strokeWeight(8.1);

  if (level<max) {
    strokeWeight(scale / 12);
    pushMatrix();
    L(angle + deviation);
    F(scale - proportion);
    tree(level, max, scale, proportion, angle, deviation);
    popMatrix();

    strokeWeight(scale/12);

    pushMatrix();
    R(angle - deviation);
    F(scale + proportion);
    tree(level, max, scale, proportion, angle, deviation);
    popMatrix();
  }
}

void F(float length) {
  if (length < 79.7) stroke(random(0, 255), random(0, 255), random(0, 255));
  else stroke(255);
  if (length > 80) strokeWeight(12.5);
  //strokeWeight(abs(1.9));
  line(0, 0, 0, -length);
  translate(0, -length);
}

void L(float angle) {
  rotate(radians(-angle));
}

void R(float angle) {
  rotate(radians(angle));
}

float generate1000sX() {
  newRandomX = round(random(0, 2000));
  return newRandomX;
}

float generate1000sY() {
  newRandomY = round(random(0, 2000));
  return newRandomY;
}

//failsafes/changing sketches
void keyPressed() {
  if (keyCode == UP) sketchNum++;
  if (keyCode == DOWN) sketchNum--;
  if (key == '0') blankTrue++;
}
