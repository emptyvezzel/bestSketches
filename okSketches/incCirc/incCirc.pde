float circSpace = 2.0;
float sinVar = 0.0;
float sinSize = 1.0;
float difVar = 1.0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
  circSpace = 3.9;
  //noStroke();
  fill(255);
  sinVar += 0.5;
  sinSize = 16.5;
  //90
  translate(width/2, height/2);
  for (int i = 15; i > 0; i--) {
    if(i % 2 == 0){ fill(255); stroke(0); }
    else { fill(0);stroke(255); }
    sphere(20*i-circSpace);
    translate(0, 0, sin(i*difVar)*84.2);
    //ellipse(width/2, height/2+sin(i+sinVar)*sinSize, 20*i-circSpace, 10*i-circSpace);
  }
  difVar += 0.0001;
}
