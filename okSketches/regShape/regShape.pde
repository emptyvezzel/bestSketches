int layers = 80;
float maxRadius;
int points = 200;

void setup() {
  size(1000, 1000);
  colorMode(HSB);
  maxRadius = width * 0.5;
}

void draw() {
  background(0);
  noFill();
  layers = 80;
  maxRadius = 800;
  for (int i = layers; i > 0; i--) {
    float t = map(i, 0, layers, 0, 1);
    stroke(getGradientColor(t));
    strokeWeight(2);
    drawIrregularCircle(width / 2, height / 2, maxRadius * (float)i / layers, i);
  }
}

void drawIrregularCircle(float x, float y, float radius, int layer) {
  beginShape();
  for (int i = 0; i < points; i++) {
    float angle = map(i, 0, points, 0, TWO_PI);
    float offset = sin(angle * 10) * 30+(layer*1.0);
    float r = radius + offset * sin(angle * 5);
    float px = x + cos(angle) * r;
    float py = y + sin(angle) * r;
    vertex(px, py);
  }
  endShape(CLOSE);
}

color getGradientColor(float t) {
  float red = map(sin(t * 8), -1, 1, 255, 50);
  float blue = map(sin(t * 10 + PI / 3), -1, 1, 255, 100);
  float yellow = map(sin(t * 1 + PI), -1, 1, 255, 100);
  return color(red, yellow, blue);
}
