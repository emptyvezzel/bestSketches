int numBalls = 300;
int backDraw = 0;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(800, 800);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  if(backDraw % 2 == 0) background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].update();
    balls[i].display();
  }
}

class Ball {
  float x, y, angle;
  float speed;
  float size;
  color c;
  boolean isChanging;
  float r,g,b;
  
  Ball() {
    x = random(width);
    y = random(height);
    angle = random(TWO_PI);
    speed = random(1, 4);
    size = random(2,10);
    c = color(random(255),random(255),random(255));
    isChanging = false;
    r = random(255);
    g = random(255);
    b = random(255);
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
    if (frameCount % 30 == 0) {
      isChanging = true;
    }
    if (isChanging) {
      c = color(r + random(-25, 25), g + random(-25, 25), b + random(-25, 25));
    }
    if (frameCount % 60 == 0) {
      isChanging = false;
    }
  }

  void display() {
    noStroke();
    fill(c, 200);
    ellipse(x, y, size, size);
  }
}

void keyPressed(){
  backDraw++;
}
