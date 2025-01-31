import ddf.minim.*;
int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;
float flying = 0;
Minim minim;
AudioInput in;
float[][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}


void draw() {
  flying -= 0.07;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0.00;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -264, -113);
      xoff += 0.4;
    }
    yoff += 0.3;
  }
  background(0);
  stroke(255);
  noFill();
  translate(width/2, height/2+39);
  rotateX(PI/3.82);
  translate(-w/2, -h/2);
  for (int y = 2; y < rows-4; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
