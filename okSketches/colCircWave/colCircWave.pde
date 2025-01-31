float x;
float y;
float theta;
float sz;
float radz = 9;
int num = 3000;
int backBool = 0;

//color scheme
int lerpToggle;
float strokeWeight = 5.0;
float lerpVal = 0;
float lerpInc = 0.01;
color col0 = #DC3522;
color col1 = #D9CB9E;
color col2 = #374140;
color col3 = #2A2C2B;
color col4 = #1E1E20;

//minim
import ddf.minim.*;
Minim minim;
AudioInput in;
float adj = 50;

void setup() {
  size(1000, 1000);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  if(backBool % 2 == 0) background(0);
  strokeWeight(3.00);
  noFill();
  float x=width/10, y=height/10;
  float radius=0.2; 
  float angle = 0.00;
  adj = 50;
  num = 4000;
  for (int i=2; i<num; i++) {
    x = width/2 + sin(angle)*radius;
    y = height/2 + cos(angle)*radius;
    float sz = map(sin(theta+TWO_PI/num*i*80), -1, 1, 0, 25);
    float scal = 1.00 + 2/num*2*i;
    stroke(i/1%360, 200, 255);
    ellipse(x, y, sz*scal + in.left.get(i%1024)*adj, sz*scal + in.left.get(i%1024)*adj);
    angle -= radians(radz);
    radius -= 0.2;
  }
  theta -= 0.05;
  //radz += 0.000001;
}

color custCol(int num){
  color col;
  lerpVal += lerpInc * num % 0.0001;
  if (lerpVal > 1) {
    lerpVal = 0;
    lerpToggle++;
  }
  if (lerpToggle > 4) lerpToggle = 0;
  if (lerpToggle == 0) col = lerpColor(col0, col1, lerpVal);
  else if (lerpToggle == 1) col = lerpColor(col1, col2, lerpVal);
  else if (lerpToggle == 2) col = lerpColor(col2, col3, lerpVal);
  else if (lerpToggle == 3) col = lerpColor(col3, col4, lerpVal);
  else col = lerpColor(col4, col0, lerpVal);;
  return color(col);
}

void keyPressed(){
  backBool++;
}
