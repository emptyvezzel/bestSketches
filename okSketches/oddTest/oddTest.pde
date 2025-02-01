int cols = 2;
int rows = 1;
color bgColor, dotColor, gradientColor;
int padding = 50;
float breathingFactor;
float angleOffset;
float cx, cy, maxSize, spacing;

void setup() {
  size(800, 1200);
  bgColor = color(240, 225, 205);
  dotColor = color(120, 40, 40);
  gradientColor = color(200, 100, 100);
  cx = width * 0.75;
  cy = height * 0.5;
  maxSize = 350;
  spacing = 15;
  breathingFactor = 0;
  angleOffset = 0;
}

void draw() {
  background(bgColor);
  breathingFactor = sin(frameCount * 0.01) * 20 + 30;
  angleOffset += 0.005;
  float w = width / 2.0;
  float h = height;
  for (int i = 0; i < 3; i++) {
    float x = w * 0.5;
    float y = h * (0.3 + i * 0.3);
    float size = breathingFactor * 4;
    for (float r = size; r > 0; r -= 20) {
      float alpha = map(r, size, 0, 50, 255);
      fill(gradientColor, alpha);
      noStroke();
      ellipse(x, y, r, r);
    }
  }
  stroke(dotColor);
  noFill();
  for (float r = 0; r < maxSize; r += spacing) {
    beginShape();
    for (float a = 0; a < TWO_PI; a += PI / 36) {
      float offset = sin(a * 5 + angleOffset) * 10;
      float x = cx + (r + offset) * cos(a);
      float y = cy + (r + offset) * sin(a);
      vertex(x, y);
    }
    endShape(CLOSE);
  }
  stroke(dotColor);
  strokeWeight(1);
  noFill();
  rect(padding, padding, width - 2 * padding, height - 2 * padding);
}
