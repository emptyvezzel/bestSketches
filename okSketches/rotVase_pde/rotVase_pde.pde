int circAmt = 20;
double step = 2*Math.PI/20;
float x0;
float y0;
float x1;
float y1;
float dist = 400;
float testVar = 0.01;
int h = 150; 
int k = 150;
int r = 50;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  stroke(255);
  testVar += 0.02;
  circAmt = 50;
  dist = 400;
  h = 200; 
  k = height/2;
  r = 100;
  for (double i = 0; i < 2*Math.PI; i += 2*Math.PI/abs(circAmt)) {
    pushMatrix();
    x0 = h + r*(float)Math.cos(i+testVar);
    y0 = k - r*(float)Math.sin(i+testVar);    
    point(x0, y0);
    popMatrix();
    x1 = h + dist + r*(float)Math.cos(i-testVar);
    y1 = k - r*(float)Math.sin(i-testVar);    
    point(x1, y1);
    line(x0, y0, x1, y1);
  }
}
