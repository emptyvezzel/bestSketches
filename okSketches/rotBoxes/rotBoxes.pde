int space = 5;
int size = 10;
int amt = 45;
int delayAmt = amt;
float speed = 0.01;
float lim = 0.1;
float[] rotVal = new float[amt];
float[] rotKey = new float[amt];

void setup(){
  size(800, 800);
  rectMode(CENTER);
  for(int i = 0; i < amt; i++){
    rotVal[i] = 0;
    rotKey[i] = 1;
  }
  colorMode(HSB);
}

void draw(){
  background(0);
  noFill();
  stroke(0);
  space = 5;
  size = 5;
  speed = 0.01;
  lim = 0.4;
  translate(width/2, height/2);
  for(int i = 0; i < amt; i++){
    strokeWeight(21.0 + amt*1.0);
    pushMatrix();
    rotate(rotVal[i]);
    stroke(598*abs(rotVal[i]), 255, 255);
    rect(0, 0, size*i*space + size, size*i*space + size);
    popMatrix();
  }
  for(int i = 0; i < amt - delayAmt; i++){
    if(rotVal[i] > lim){
      rotKey[i] = 0;
    }
    if(rotVal[i] < -lim){
      rotKey[i] = 1;
    }
    if(rotKey[i] == 1) rotVal[i] += speed;
    else rotVal[i] -= speed;
  }
  if(frameCount % 6 == 0){
    if(delayAmt != 0) delayAmt -= 1;
  }
}
