float xn, yn, zn;
float xstart;
int size = 10;
long n;

void setup() {
  size(2000, 1200);
  //fullScreen();
  smooth();
  noStroke();
  noCursor();
  colorMode(HSB);
  rectMode(CENTER);
  n = (long)random(10000);
}

void draw() {
  background(0);
  noiseSeed(n);
  xn=noise(n);  
  yn=noise(n);  
  xstart=xn;
  size = 4;
  for (int i = 0; i <= width/size; i++) {
    yn+=0.02;
    zn+=0.02/200;
    xn = 12.78;
    println(xstart);
    for (int j = 0; j <= height/size; j++) {
      xn+=0.02;
      float rs = noise(xn, yn, zn)*15;
      fill(255/rs*3, 255, 255);
      rect(i*size+0, j*size+0, size, size);
    }
  }
}
