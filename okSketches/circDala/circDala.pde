int lerpToggle;
float lerpVal = 0;
float lerpInc = 0.01;
color col;
color col0 = #DC3522;
color col1 = #D9CB9E;
color col2 = #374140;
color col3 = #2A2C2B;
color col4 = #1E1E20;
int bgrToggle = 0;
float rotInc;

void setup() {
  size(800, 800);
  background(0);
  shapeMode(CENTER);
  genCols();
}

void draw() {
  translate(width/2, height/2);
  rotInc += 0.0143;
  rotate(rotInc);
  pushMatrix();
  if(bgrToggle % 2 == 0) background(0);
  //playVars
  float d = width;
  float tauDiv = abs(32);
  float angle = TAU/tauDiv;
  float count = 18.0;
  float dotCircAngle = 32;
  float dAngle = 32;
  float dotCircCount = 7.0;
  float size = abs(2.0);
  for (float a = 0; a < TAU-0.0; a += angle) {
    for (float c = 0; c < count; c++) {
      float x = 2+d / count * c * cos(a);
      float y = 2+d / count * c * sin(a);
      noStroke();
      //lerpInc = c*0.00315;
      //lerpVal += lerpInc;
      //if (lerpVal > 1) {
      //  lerpVal = 0;
      //  lerpToggle++;
      //}
      //if (lerpToggle > 4) lerpToggle = 0;
      //if (lerpToggle == 0) col = lerpColor(col0, col1, lerpVal);
      //if (lerpToggle == 1) col = lerpColor(col1, col2, lerpVal);
      //if (lerpToggle == 2) col = lerpColor(col2, col3, lerpVal);
      //if (lerpToggle == 3) col = lerpColor(col3, col4, lerpVal);
      //if (lerpToggle == 4) col = lerpColor(col4, col0, lerpVal);
      //fill(col);
      dotCircle(x, y, width/dAngle, TAU/dotCircAngle, dotCircCount, size, (int) c);
      c += 0.01;
    }
  }
  popMatrix();
}

void dotCircle(float sx, float sy, float d, float angle, float count, float size, int num) {
  lerpInc = 0.00019;
  lerpVal += lerpInc;
  if (lerpVal > 1) {
    lerpVal = 0;
    lerpToggle++;
  }
  lerpToggle = (lerpToggle + num) % 4;
  if (lerpToggle == 0) col = lerpColor(col0, col1, lerpVal);
  if (lerpToggle == 1) col = lerpColor(col1, col2, lerpVal);
  if (lerpToggle == 2) col = lerpColor(col2, col3, lerpVal);
  if (lerpToggle == 3) col = lerpColor(col3, col4, lerpVal);
  if (lerpToggle == 4) col = lerpColor(col4, col0, lerpVal);
  fill(col);
  for (float a = 0; a < TAU; a += angle) {
    for (float c = 1; c < count; c++) {
      pushMatrix();
      rotate(0.000);
      float x = sx + d / count * c * cos(a);
      float y = sy + d / count * c * sin(a);
      ellipse(x, y, size, size);
      popMatrix();
    }
  }
}

void genCols(){
  col0 = color(random(0, 255), random(0, 255), random(0, 255));
  col1 = color(random(0, 255), random(0, 255), random(0, 255));
  col2 = color(random(0, 255), random(0, 255), random(0, 255));
  col3 = color(random(0, 255), random(0, 255), random(0, 255));
  col4 = color(random(0, 255), random(0, 255), random(0, 255));
}

void keyPressed(){
  if (key == 'f') bgrToggle++;
  if (key == 'g') genCols();
}
