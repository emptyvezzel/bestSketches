int count = 200;
final float graphInc = TWO_PI/count;

//See for more shapes: http://paulbourke.net/geometry/supershape/

boolean animateGraph = true;

float minRadiusFactor = 0.7f;
float dotSize = 8;
float radius = 200;
float minLength = 5;
float maxLength = 80;
float thickness = 4;

float off = 0;

float a = 1;
float b = 1;
float m = 5;
float n1 = 1;
float n2 = 1;
float n3 = 1;

boolean oscillateM = true;

float supershapeR2(float theta, float r, float m) {
  float p1 = pow(abs(cos(m/4 * theta)/a), n2);
  float p2 = pow(abs(sin(theta * m / 4)/b), n3);
  return 1/pow(p1 + p2, 1/n1) * r;
}

//A simplified version of the formula that doesn't
//use a, b, n1, n2 or n3
float supershapeSimple(float theta, float r, float m) {
  float p1 = pow(abs(cos(m/4 * theta)), n2);
  float p2 = pow(abs(sin(theta * m / 4)), n3);
  return 1/(p1 + p2) * r;
}

float supershapeR(float theta, float r) {
  return supershapeR2(theta, r, m);
}

float supershape(float theta) {
  return supershapeR(theta, m);
}

void update() {
  off = radians(frameCount/3f % 360);
  if (oscillateM) {
    m = sin(off) * 5;
  }
}

void drawGraph() {
  for (float a = 0; a<TWO_PI; a += graphInc) {
    pushMatrix();
    float r = supershapeR(a + int(animateGraph) * off, radius);
    rotate(a);
    float adjRa = constrain(r, radius * minRadiusFactor, radius);
    line(r, 0, r + map(adjRa, radius * minRadiusFactor, radius, minLength, maxLength), 0);
    popMatrix();
  }
}

void setup() {
  size(800, 600, P2D);
  strokeCap(MITER);
  stroke(255);
  strokeWeight(thickness);
}

void draw() {
  update();
  
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  
  drawGraph();

  popMatrix();
}
