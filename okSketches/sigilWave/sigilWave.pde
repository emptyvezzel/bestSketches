int cols = 12;
int rows = 12;
float noiseScale = 0.2;
float threshold = 0.5;
int symmetry = 4;
float time = 0;
float waveSpeed = 0.02;
float waveAmplitude = 20;
boolean regenerate = true;

void setup(){
  size(600, 600);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  waveSpeed = 0.002;
  for(int i = 0; i < symmetry; i++){
    pushMatrix();
    rotate(TWO_PI / symmetry * i);
    drawSigil();
    scale(1, -1);
    drawSigil();
    popMatrix();
  }
  
  time += waveSpeed;
}

void drawSigil(){
  float stepX = width / (float)cols;
  float stepY = height / (float)rows;
  for(int x = -width/2; x < width/2; x += stepX){
    for(int y = -height/2; y < height/2; y += stepY){
      float offsetX = sin(time + x * 0.05) * waveAmplitude;
      float offsetY = cos(time + y * 0.05) * waveAmplitude;
      float n = noise((x + offsetX) * noiseScale, (y + offsetY) * noiseScale);
      if(n > threshold){
        drawShape(x + offsetX, y + offsetY, stepX * 0.8);
      }
    }
  }
}

void drawShape(float x, float y, float s){
  pushMatrix();
  translate(x, y);
  stroke(0);
  strokeWeight(2);
  noFill();
  beginShape();
  for(float a = 0; a < TWO_PI; a += PI / 6){
    float r = s * (0.5 + noise(cos(a) * noiseScale, sin(a) * noiseScale));
    float vx = cos(a) * r;
    float vy = sin(a) * r;
    vertex(vx, vy);
  }
  endShape(CLOSE);
  popMatrix();
}

void keyPressed(){
  if(key == ' '){
    noiseSeed(int(random(10000)));
    redraw();
  }
}
