float x = 250;
float y = 250;
float x1 = 0;
float y1 = 0;
float pos=0.1;
float r = 100;
float step = 0.1;
float size = 25;
float vari = 0.01;
float[] xArr0 = new float[20];
float[] yArr0 = new float[20];
float[] xArr1 = new float[20];
float[] yArr1 = new float[20];
int dirvari = 1;

void setup () {
  size(800, 800);
}

void draw () {
  x = width/2;
  y = 200;
  background(0);
  stroke(254);
  fill(255);
  strokeWeight(2.0);
  r = 200;
  step = 0.05;
  size = 0;
  vari = 0.35;
  for (int i = 0; i < 20; i++) {
    x1 = x + r * cos(pos + i * vari);
    y1 = y + r * sin(pos + i * vari);
    ellipse(x1, y1, size, size);
    xArr0[i] = x1;
    yArr0[i] = y1;
  }
  for (int i = 0; i < 20; i++) {
    x1 = x + r * cos(dirvari*pos + i * vari);
    y1 = height-y + r * sin(dirvari*pos + i * vari);
    ellipse(x1, y1, size, size);
    xArr1[i] = x1;
    yArr1[i] = y1;
  }
  for (int i = 0; i < 20; i++){
    line(xArr0[i], yArr0[i], xArr1[i], yArr1[i]);
  }
  pos += step;
}

void keyPressed(){
  if(key == ' ') dirvari *= -1;
}
