int lerpToggle;
float strokeWeight = 5.0;
float lerpVal = 0;
float lerpInc = 0.01;
color col0 = #DC3522;
color col1 = #D9CB9E;
color col2 = #374140;
color col3 = #2A2C2B;
color col4 = #1E1E20;
color[] colArray;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  strokeWeight(strokeWeight);
  colArray = new color[Math.round(width/strokeWeight) + 1];
}

void draw() {
  background(0);
  noFill();
  translate(width/2, height/2);
  lerpInc = 0.0001;
  for (int i = 0; i < colArray.length; i++) {
    lerpVal += lerpInc * i % 0.0001;
    if (lerpVal > 1) {
      lerpVal = 0;
      lerpToggle++;
    }
    if (lerpToggle > 4) lerpToggle = 0;
    if (lerpToggle == 0) colArray[i] = lerpColor(col0, col1, lerpVal);
    if (lerpToggle == 1) colArray[i] = lerpColor(col1, col2, lerpVal);
    if (lerpToggle == 2) colArray[i] = lerpColor(col2, col3, lerpVal);
    if (lerpToggle == 3) colArray[i] = lerpColor(col3, col4, lerpVal);
    if (lerpToggle == 4) colArray[i] = lerpColor(col4, col0, lerpVal);
    stroke(colArray[i]);
    rect(0, 0, width-strokeWeight*i, height-strokeWeight*i);
  }
}
