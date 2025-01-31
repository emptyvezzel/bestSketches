float W;
int Counter = 0;
float Angle;

void setup() {
  W = 720;
  size(720, 720);
}

void draw() {
  W = 720;
  Counter++;
  fill(W, 30);
  background(255);
  //rect(0, 0, W, W);
  Angle = (PI + sin(Counter * 0.02)) / 7;
  for (float j = 0; j < TWO_PI; j += TWO_PI / 8) {
    Tree(9, W / 2, W / 2, j, 62);
  }
  // Corrected copy() usage
  //copy(10, 20, (int) W - 20, (int) W - 20, 0, 0, (int) W - 0, (int) W - 0);
}

void Tree(int step, float x, float y, float rad, float lengs) {
  if (step > 0) {
    float inf = 20 - step; 
    float n = noise((x + Counter) / W, (y - Counter) / W) * inf;
    line(x, y, x += cos(rad) * lengs + cos(n) * inf, y += sin(rad) * lengs + sin(n) * inf);
    step--;
    lengs *= 0.8;
    Tree(step, x, y, rad + Angle, lengs);
    Tree(step, x, y, rad - Angle, lengs);
  }
}
