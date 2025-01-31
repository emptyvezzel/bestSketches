int x = 0;

void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB,360,100,100);
  smooth();
}

void draw() {
  background(255);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float n = (sin(sqrt(sq(i - width / 2) + sq(j - height / 2)) / 50 + x / 100) + 1) / 2;
      stroke(map(n, 0, 1, 0, 360), 100, 100);
      point(i, j);
    }
  }
  x++;
}
