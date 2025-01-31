import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity = 100;
float size = 0;
float xPos = 2;
float armVar = 8;
int rotVal = 0;

void setup() {
  size(800, 800);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  size = 2.0;
  armVar = 360.0;
  noStroke();
  translate(width/2, height/2);
  background(0);
  rotate(radians(rotVal));
  for (int j = 0; j < 39; j++) {
    for (int i = 0; i < armVar; i++) {
      pushMatrix();
      rotate(radians(360/armVar * i));
      ellipse(xPos + in.left.get(i)*sensitivity, + in.left.get(i)*sensitivity, size, size);
      popMatrix();
    }
    xPos += j*1.0;
    fill(0, 255, j*31);
  }
  sensitivity = 600;
  xPos = 2.0;
  rotVal++;
  //saveFrame("line-######.png");
}
