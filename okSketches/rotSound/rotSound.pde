import java.util.Random;
import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity;
int space = 0;
float rot = 0.0;
float[] rotInit = new float[2000];

void setup() {
  size(2000, 1000);
  minim = new Minim(this);
  in = minim.getLineIn();
  smooth();
  rectMode(CENTER);
  randomRotVal();
}

void draw() {
  background(0);
  sensitivity = 182;
  space = 2;
  noStroke();
  fill(255);
  for (int i = 0; i < 2000/space; i++) {
    pushMatrix();
    translate(width/2, height/2);
    translate(-width/2 + i*space, 0);
    rotate(rot + rotInit[i]);
    rect(0, 0, 1, -100 + in.left.get(i)*sensitivity + 10);
    popMatrix();
  }
  rot += 0.01;
}

void randomRotVal(){
  for(int i = 0; i < rotInit.length; i++){
    Random rand = new Random();
    float random = rand.nextFloat() * (360.00 - 0.00);
    rotInit[i] = random;
  }
}

void keyPressed(){
  if(key == 'r') randomRotVal();
}
