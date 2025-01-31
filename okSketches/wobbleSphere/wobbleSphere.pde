float x1, y1; // point 1
float x2, y2; // control point 1
float x3, y3; // point 2
float x4, y4; // control point 2
float a = 0; // angle

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  x1 = 250;
  y1 = 75;
  x2 = 425;
  y2 = 75;
  x3 = 75;
  y3 = 425;
  x4 = 250;
  y4 = 425;
  background(0);
  strokeWeight(3);
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255, 50);
  x2 = 250 + (sin(radians(a)) * 355);
  x3 = 250 - (cos(radians(a)) * 355);  
  noFill(); 
  stroke(255, 155 + sin(radians(a * 2)) * 100, 155 + cos(radians(a * 2)) * 100);
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  x2 = 250 - (sin(radians(a)) * 355);
  x3 = 250 + (cos(radians(a)) * 355);  
  stroke(255, 155 + sin(radians(a * 2)) * 100, 155 + cos(radians(a * 2)) * 100);
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  a += 3; // increase angle (animate)
}
