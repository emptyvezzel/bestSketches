// made by Jack Murphy / emptyvezzel

float zoom = 1;
int linevar = 1;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  lights();
  background(255);
  translate(width/2, height/2, 0);
  scale(zoom);
  for (int i = 0; i < 10; i++) {
    if ((linevar & 1) == 0) {
      stroke(255, 50);
    } else {
      noStroke();
    }
    rotateX(mouseY*0.05);
    rotateY(mouseX*0.05);
    fill(mouseX*2, 0, 160);
    sphereDetail(mouseX/50);
    sphere(280);
  }
}

void keyPressed() {
  if (keyCode == UP) zoom += 0.2;
  if (keyCode == DOWN) zoom -= 0.2;
  if (key == ' ') linevar++;
}
