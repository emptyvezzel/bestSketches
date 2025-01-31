void setup(){
  size(400, 400);
}

void draw(){
  background(0);
  
  for(int i = 0; i < 25; i++){
    stroke(255);
    noFill();
    rectMode(CENTER);
    rect(width/2, height, 74-i*3, 42+i*29, 19);
  }
}
