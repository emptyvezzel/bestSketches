float yoff = 0;
float divVal = 200;
float dx = 0.050;
int distance = 100;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);

  stroke(162, 221, 247);
  noFill();
  strokeWeight(1.0);
  dx += 0.00040;
  distance = 160;
  if (dx > 1) dx = 0;
  if (divVal == 0) divVal = 1;
  float da = PI / divVal;
  float xoff = 0;
  for (int j = 0; j < 6; j++) {
    for (int k = 0; k < 6; k++) {
      pushMatrix();
      translate(distance*j, distance*k);
      for (int i = 0; i < 5; i++) {
        beginShape();
        for (float a = 0; a <= TWO_PI; a += da) {
          float n = noise(xoff, yoff)*1.01;
          float r = sin(2 * a) * map(n, 0, 1+(i*0.10), 11*(i*0.70), 140);
          float x = sin(yoff) * r * cos(a);
          float y = r * sin(a);
          if (a < PI) {
            xoff += dx;
          } else {
            xoff -= dx;
          }
          vertex(x, y);
        }
        endShape();
      }
    popMatrix();
    }
  }

  yoff += 0.01;
}
