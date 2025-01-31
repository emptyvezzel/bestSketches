import peasy.*;
PeasyCam cam;
float rotVal = 0;
int chooseVal = 0;
float colVal = 0;
float addVal = 0.00015;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 0);
  colorMode(HSB);
}

void draw() {
  rectMode(CENTER);
  background(0);
  translate(-306, -465);
  pushMatrix();
  noFill();
  rotVal += addVal;
  translate(width/2, height/2);
  strokeWeight(10.96);
  for (int i = 0; i < 400; i++) {
    if(i % 4 == 0)
      stroke(26, 209, 182);
      //stroke(#FCB10F);
    if(i % 4 == 1)
      //stroke(219, 159, 159);
      stroke(#801340);
    if(i % 4 == 2)
      stroke(126, 138, 147);
      //stroke(#4D2975);
    if(i % 4 == 3)
      //stroke(207);
      stroke(#244479);
    rotateX(rotVal);
    rotateY(rotVal);
    rotateZ(rotVal);
    if(chooseVal % 2 == 0)
      rect(0, 0, 0+i*5, 0+i*5);
    else
      ellipse(0, 0, 0+i*5, 0+i*5);
  }
  popMatrix();
  System.out.println(rotVal);
}
void keyPressed(){
  if(key == ' ') chooseVal++;
  if(key == '0') rotVal = 0;
  if(key == '1') rotVal = 0.4200;
  if(key == '2') rotVal = 0.6600;
  if(key == '3') rotVal = 0.8100;
  if(key == '4') rotVal = 1.0400;
  if(key == '5') rotVal = 1.5000;
  if(key == '6') rotVal = 2.0000;
  if(key == '7') rotVal = 2.3000;
  if(key == '8') rotVal = 4.6000;
  if(key == '`') rotVal = PI;
  if(key == '.') addVal *= 2;
  if(key == ',') addVal /= 2;
  if(keyCode == SHIFT) addVal *= -1;
}
