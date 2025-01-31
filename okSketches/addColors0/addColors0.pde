float dist = 2.0;
float xVar = 0.0;
float yVar = 0.0;
float changeVar = 0.0;
float changeSpeed = 10;
int mouseVar = 1;

void setup() {
  size(800, 800);
  //fullScreen();
  noCursor();
}

void draw() {
  background(0);
  strokeWeight(10.0);
  dist = 35.0;
  noFill();
  if (mouseVar % 3 == 0) {
    xVar = mouseX;
    yVar = mouseY;
  }
  if (mouseVar % 3 == 1){
    xVar = changeVar;
    yVar = height/2;
  }
  if (mouseVar % 3 == 2){
    xVar = width/2;
    yVar = height/2;
  }
  blendMode(ADD);
  for (int i = 0; i < 35; i++) {
    stroke(255, 0, 0);
    ellipse(xVar, yVar, i*dist, i*dist);
    stroke(0, 0, 255);
    ellipse(width-xVar, height-yVar, i*dist, i*dist);
    stroke(0, 255, 0);
    ellipse(width/2, height/2, i*dist, i*dist);
  }
  changeVar += changeSpeed;
  if(changeVar > 1000 || changeVar < -200) changeSpeed *= -1;
}

void keyPressed() {
  if (key == ' ') mouseVar++;
}
