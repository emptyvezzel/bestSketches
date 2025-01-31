void setup(){
  size(512, 768);
}

void draw(){
  noStroke();
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      fill(random(0, 255), random(0, 255), random(0, 255));
      rect(i, j, 1, 1);
    }
  }
  if(frameCount > 5 && frameCount < 7) save("background.png");
}
