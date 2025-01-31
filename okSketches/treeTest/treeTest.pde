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
import ddf.minim.*;
Minim minim;
AudioInput in;

void setup() {
  //fullScreen();
  size(1000, 1000);
  minim = new Minim(this);
  in = minim.getLineIn();
  smooth();
  finalX = generate1000sX();
  finalY = generate1000sY(); 
}

void draw() {
  background(0);
  translate(width/2, height+310);
  strokeWeight(10);
  swaySpeed = 11.6;
  growSpeed = 8.84;
  // if (swayVar % 2 == 0) {
  //xGrowth = xChange;
  //yGrowth = yChange;
  // } else {
  //finalX = generate1000sX();
  //finalY = generate1000sY();     
  // }
  //xGrowth = 398;
  //yGrowth = 456;
  //xChange += swaySpeed*swayVar;
  //if (xChange > width || xChange < 0) {
  //  yChange += 10;
  //  swayVar *= -1;
  //}
  //if (yChange > height || yChange < 0) xChange *= -1;
  if (yChange > height) yChange = 100;
  proportion = in.left.get(348)*222;
  F(600);
  stroke(255);
  tree(2, 15, 300, proportion, map(yGrowth, 0, height, 0, 90), map(xGrowth, 0, width, 60, -60)); //<>//
  System.out.println("xGrowth: " + xGrowth + "\nyGrowth: " + yGrowth);
  if (yGrowth < finalY) { 
    yGrowth += growSpeed;
    check1 = true;
  } else check0 = true;
  if (yGrowth > finalY) {
    yGrowth -= growSpeed;
    check0 = true;
  } else check1 = true;
  if (xGrowth < finalX){
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
  newRandomX = round(random(0, 1000));
  return newRandomX;
}

float generate1000sY() {
  newRandomY = round(random(0, 1000));
  return newRandomY;
}

void keyPressed() {
  if (key == ' ') stayVar++;
}
