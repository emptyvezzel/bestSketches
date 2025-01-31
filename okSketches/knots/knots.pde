float angle = 0;
ArrayList<PVector> vectors = new ArrayList<PVector>();
float beta = 0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(angle);
  angle += 0.03;
  float r = 100*(0.8 + 1.6 * sin(6 * beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);
  stroke(255, r, 255);
  vectors.add(new PVector(x,y,z));
  beta += 0.01;
  noFill();
  stroke(255);
  strokeWeight(2);
  beginShape();
  for (PVector v : vectors) {
    vertex(v.x, v.y, v.z);
  }
  endShape();
}
