int N = 360, r =150, t=-90;
float m, xx, yy;
float vari = 0;
float change = 5.00;

void setup() {
  size(600, 400, P3D);  
  //smooth();
}
void draw() {
  background(0); 
  if (mousePressed) {
    xx = map(mouseX, 0, width, -180, 180);
    yy = map(mouseY, 0, height, -180, 180);
  }
  pushMatrix();
  translate(width/2, height/2);
  rotateX(radians(yy));
  rotateY(radians(xx)); 
  noFill(); 
  stroke(255, 200);
  for (int  i=0; i<360; i+=36) {
    float thetaA = radians(i*360/N); 
    strokeWeight(3.0);
    beginShape();
    for (int  j=-90; j<=90; j++) { 
      m = map(vari, 0, width, -4*j, 2*j);
      float thetaB = radians(j*360/N);
      float x = r*cos(thetaA+radians(j+m))*cos(thetaB);
      float y = r*sin(thetaA+radians(j+m))*cos(thetaB); 
      float z = r*sin(thetaB);
      vertex(x, y, z);
    } 
    endShape();
  }
  popMatrix();
  if (t<90)t++;
  else t=-90;
  vari += sin(change)*5;
  if(vari < 0 || vari > 800) change *= -1;
}
