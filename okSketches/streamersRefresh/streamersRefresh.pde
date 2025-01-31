int numLines = 20;
Line[] lines = new Line[numLines];

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  for (int i = 0; i < numLines; i++) {
    lines[i] = new Line();
  }
}

void draw() {
  //background(0);
  for (int i = 0; i < numLines; i++) {
    lines[i].update();
    lines[i].display();
  }
}

class Line {
  float x, y, angle;
  float hue;
  float speed;

  Line() {
    x = random(width);
    y = random(height);
    angle = random(TWO_PI);
    hue = random(360);
    speed = random(1, 4);
  }

  void update() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    angle += random(-0.1, 0.1);
    if (x < 0 || x > width) {
      x = (x + width) % width;
    }
    if (y < 0 || y > height) {
      y = (y + height) % height;
    }
  }

  void display() {
    fill(hue, 100, 100);
    ellipse(x, y, speed*2, speed*2);
  }
}
