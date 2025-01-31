import ddf.minim.*;
Minim minim;
AudioInput in;
int sensitivity;
int N = 9000;
float rad=0;
float colVar = 0;
float crazyVar = 1.00000;

void setup() {
  size(800, 800);
  minim = new Minim(this);
  in = minim.getLineIn();
  colorMode(HSB);
}

void draw() { 
  //background(255);
  N = 9000*1;
  sensitivity = 372;
  //rad = 0;
  stroke(colVar%255, 255, 255); 
  noFill();
  strokeWeight(2);
  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<N; i+=30) {
    float r = map(i, 0, N, in.left.get(round(i%1024))*sensitivity, width);
    float x = r*1.00*sin(radians(i*crazyVar)-rad*1.00)*1.00;
    float y = r*cos(radians(i*crazyVar)-rad);
    curveVertex(x, y);
  }
  endShape();
  rad+=0.1;
  crazyVar -= 0.00100;
  colVar += 0.5;
}
