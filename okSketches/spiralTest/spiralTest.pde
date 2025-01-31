final int NUM_LINES = 500;             
final int NUM_TURNS = 10;      
final float START_ANGLE_CHANGE = 0.5;
final float CURVERES=0.25;  //Curve step resolution
 
float startAngle = 0;   
float maxRadius;
 
void setup() {
  size(500, 500);
  maxRadius = sqrt(sq(width/2)+sq(height/2));  
}
 
void draw() {
  background(255);
  beginShape();
  for (float i = 0; i<NUM_LINES; ) { 
    curveVertex(px(i), py(i));
    i+=pow(map(i,0,500,1.5,1),2)*CURVERES;
  }
  endShape();
  startAngle+=START_ANGLE_CHANGE;
}
 
 
float px(float i) {
  return width/2+i*cos((i+startAngle)*NUM_TURNS*TWO_PI/maxRadius);
}
 
float py(float i) {
  return height/2+i*sin((i+startAngle)*NUM_TURNS*TWO_PI/maxRadius);
}
 
void mousePressed() {
  looping=!looping;
}
