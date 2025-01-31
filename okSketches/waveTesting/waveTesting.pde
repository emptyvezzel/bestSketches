int size = 1;
float scale = 0.0010;
float change = 400;
float colVal = 0;
int timesVar = 1;

void setup(){
  size(1080, 1080);
  colorMode(HSB);
}

void draw(){
  size = 3;
  scale = 0.0016;
  background(0);
  noStroke();
  for(int j = 0; j < height; j+= size){
    for(int i = 0; i < width; i+= size){
      //change/150
      fill(abs(colVal)*(ceil(abs(change)*noise(scale*i,scale*j, change/150))%3)%255, 255, 255);
      rect(i, j, size, size);
    }
  }
  println(change);
  //if(colVal < 0 || colVal > 500) timesVar*=-1;
  change -= 0.5*timesVar;
  if(change < -400) change = 400;
  colVal += 0.5;
  
}
