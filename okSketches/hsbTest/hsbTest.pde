float hVal = 0;
float sVal = 0;

void setup(){
  colorMode(HSB);
  size(500, 500);
}

void draw(){
  background(hVal%255, sVal%255, 255);
  sVal += 0.1;
  hVal += 4.1;
}
