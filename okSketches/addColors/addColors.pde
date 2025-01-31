import ddf.minim.*;
Minim minim;
AudioInput in;
float dist = 2.0;
float xVar = 400.0;
float yVar = 0.0;
float changeVar = 400;
float changeSpeed = 10;
int sensitivity = 100;
int mouseVar = 2;
int amp = 1;
int startTimer;
int top = 450;
int bot = 350;
boolean timerGoing = false;

void setup() {
  size(800, 800);
  //fullScreen();
  noCursor();
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  background(0);
  strokeWeight(10.0);
  sensitivity = 200;
  dist = 50.0;
  noFill();
  if (mouseVar % 3 == 0) {
    xVar = mouseX;
    yVar = mouseY;
  }
  if (mouseVar % 3 == 1) {
    xVar = width/2;
    yVar = height/2;
  }
  if (mouseVar % 3 == 2) {
    xVar = changeVar;
    yVar = height/2;
  }
  blendMode(ADD);
  for (int i = 0; i < 25; i++) {
    //stroke(255, 0, 0);
    //ellipse(xVar+in.left.get(i)*sensitivity, yVar, i*dist, i*dist);
    //stroke(0, 0, 255);
    //ellipse(width-xVar-in.left.get(i)*sensitivity, height-yVar, i*dist, i*dist);
    //stroke(0, 255, 0);
    //ellipse(width/2, height/2-in.left.get(i)*sensitivity, i*dist, i*dist);
    stroke(255, 0, 0);
    ellipse(xVar, yVar, i*dist, i*dist);
    stroke(0, 0, 255);
    ellipse(width-xVar, height-yVar, i*dist, i*dist);
    stroke(0, 255, 0);
    ellipse(width/2, xVar, i*dist, i*dist);
  }
  amp = 1;
  if(timerGoing == false) changeVar += changeSpeed;
  else changeVar = width/2;
  if (changeVar > top || changeVar < bot) changeSpeed *= -1;
  if(round(changeVar) == width/2 && timerGoing == false) {
    changeVar = width/2;
    startTimer = frameCount;
    timerGoing = true;
    top += 50;
    bot -= 50;
  }
  if(frameCount - 5 > startTimer) timerGoing = false;
  println(xVar);
  //saveFrame("line-######.png");
}

void keyPressed() {
  if (key == ' ') mouseVar++;
}
