PVector[] points;
PVector current;
float percent = 0.5;
PVector previous;
int n = 2;

void setup() {
  size(1000, 1000);
  points = new PVector[n];
  for (int i = 0; i < n; i++) {
    float angle = i * TWO_PI / n;
    PVector v = PVector.fromAngle(angle);
    v.mult(width / 2);
    v.add(width / 2, height / 2);
    points[i] = v;
  }
  reset();
}

void reset() {
  current = new PVector(random(width), random(height));
  background(0);
  stroke(0);
  strokeWeight(8);
  for (PVector p : points) {
    point(p.x, p.y);
  }
  percent = 0.5;
  n++;
}

void draw() {
  percent += 0.002;
  if(n == 0) n = 1;
  rotate(0.001);
  points = new PVector[n];
  for (int i = 0; i < n; i++) {
    float angle = i * TWO_PI / n;
    PVector v = PVector.fromAngle(angle);
    v.mult(width / 2);
    v.add(width / 2, height / 2);
    points[i] = v;
  }
  if (frameCount % 500 == 0) reset();
  for (int i = 0; i < 1000*1; i++) {
    strokeWeight(1);
    stroke(255);
    PVector next = points[floor(random(points.length))];
    if (next != previous) {
      current.x = lerp(current.x, next.x, percent);
      current.y = lerp(current.y, next.y, percent);
      point(current.x, current.y);
    }
    previous = next;
  }
}
