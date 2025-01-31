import peasy.*;
PeasyCam cam;
import ddf.minim.*;
Minim minim;
AudioInput in;
int pts = 40; 
float angle = 0;
float radius = 60.0;
float colVar = 0.0;
int segments = 60;
int space = 50;
int sensitivity = 50;
float latheAngle = 0;
float latheRadius = 100.0;
PVector vertices[], vertices2[];
boolean isWireFrame = false;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  shapeMode(CENTER);
  minim = new Minim(this);
  in = minim.getLineIn();
  colorMode(HSB);
}

void draw() {
  translate(-400, -400, 125);
  pts = abs(40); 
  angle = 0;
  radius = 20.0;
  segments = 60;
  space = 46;
  latheAngle = 0;
  latheRadius = 7.0;
  sensitivity = 50;
  background(0);
  lights();
  translate(width/2, height/2, -100);
  for (int k = 0; k < 45; k++) {
    translate(0, 0, + in.left.get(k)*sensitivity*4);
    if (isWireFrame) {
      noFill();
      if (k % 2 == 0) stroke(0);
      else stroke(255);
    } else {
      noStroke();
      if (k % 2 == 0) fill(0);
      else fill(k * colVar % 255, 255, 255);
    }
    vertices = new PVector[pts+1];
    vertices2 = new PVector[pts+1];
    for (int i=0; i<=pts; i++) {
      vertices[i] = new PVector();
      vertices2[i] = new PVector();
      vertices[i].x = (latheRadius+k*(space + in.left.get(k)*sensitivity))  + sin(radians(angle))*radius;
      vertices[i].z = cos(radians(angle))*radius;
      angle+=360.0/pts;
    }
    latheAngle = 0;
    for (int i=0; i<=segments; i++) {
      beginShape(QUAD_STRIP);
      for (int j=0; j<=pts; j++) {
        if (i>0) {
          vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
        }
        vertices2[j].x = cos(radians(latheAngle))*vertices[j].x;
        vertices2[j].y = sin(radians(latheAngle))*vertices[j].x;
        vertices2[j].z = vertices[j].z;
        vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      latheAngle+=360.0/segments;
      endShape();
    }
  }
  colVar += 0.10;
}

void keyPressed() {
  // wireframe
  if (key == ' ') {
    if (isWireFrame) {
      isWireFrame=false;
    } else {
      isWireFrame=true;
    }
  }
}
