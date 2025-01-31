class Blob {
  float x;
  float y;
  float diameter;
  color c;
  float phase = 0;
  float zoff = 0;

  Blob(float tempD) {
    x = width/2;
    y = height;
    diameter = tempD;
  }

  void display(float input) {
    stroke(255);
    strokeWeight(2);
    noFill();
    beginShape();
    float noiseMax = map(50, 0, width, 1, 5);
    for (float a = 0; a < TWO_PI; a += radians(5)) {
      float xoff = map(cos(a + phase), -1, 1, 0, noiseMax);
      float yoff = map(sin(a + phase), -1, 1, 0, noiseMax);
      float r = map(noise(xoff, yoff, zoff), 0, 1, 100, height / 2);
      float x = r * cos(a);
      float y = r * sin(a) + input;
      vertex(x, y);
    }
    endShape(CLOSE);
    phase += 0.003;
    zoff += 0.01;
  }
}
