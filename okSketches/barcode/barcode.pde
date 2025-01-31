// made by Jack Murphy / emptyvezzel

import peasy.*;
PeasyCam cam;

void setup() {
  size(610, 610, P3D);
  smooth();
  cam = new PeasyCam(this, 300, 300, 40, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
}

void draw() {
  if (frameCount % 4 == 0) {
    background(0);
    for (int i = 0; i < 3; i++)
      for (int j = 1; j < 60; j++){
        translate(0.0, 0,0);
        rect(10+i*200, 10*j, 190, random(1, 10));        
      }
  }
}
