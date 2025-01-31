import ddf.minim.*;
Minim minim;
AudioInput in;
float counter;
float angle;
int copyVar = 1;
int sensitivity = 200;

void setup() {
  fullScreen();
  //size(1920, 1080);
  background(0);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  counter += 5;
  strokeCap(2);
  strokeWeight(1.8);
  stroke(random(0, 255), random(0, 255), random(0, 255));
  angle = (PI + sin(counter*0.02))/7;
  for (float j = 0; j < TWO_PI; j += TWO_PI/8) {
    Tree(7, width/2, height/2, j, 30+in.left.get(0)*sensitivity);
  }
  if(copyVar % 2 == 0)copy(15, 5, width-30, width-16, 0, 0, width-0, width-0);
  if(frameCount % 60 == 0) copyVar++;
}

void Tree(float step, float x, float y, float rad, float lengs) {
  if (step > 0) {
    float inf = 20 - step; // influence of noise
    float n = noise((x+counter)/width, (y-counter)/height)*inf;
    line(x, y, x+=cos(rad)*lengs+cos(n)*inf, y+=sin(rad)*lengs+sin(n)*inf);
    step -= 1.0;
    lengs *= 0.9;
    Tree(step, x, y, rad+angle, lengs);
    Tree(step, x, y, rad-angle, lengs);
  }
}

void keyPressed(){
  if(key == '1') background(0);
  if(key == '2') copyVar += 1;
}
