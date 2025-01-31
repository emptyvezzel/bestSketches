final int startLen = 200;
float rot = 0;
//branchLen = 0;
int count = 80;

void setup(){
  size(500, 500);
}

void draw(){
  background(255);
  translate(width/2, height-40);
  strokeWeight(2);
  stroke(0, 2);
  for(float i = 0; i < count; i++){
    rot = map(i, 0, count, PI/15, PI/2);
    drawBranch(0, startLen);
  }
}

void drawBranch(int depth, float len){
  if(len < 15) return;
  
   float branchLen = len * 0.69;
   
   if(depth > 0) line(0, 0, 0, -branchLen);
   
   for(int i = -1; i <= 1; i+= 2){
     pushMatrix();
     translate(0, -branchLen);
     rotate(-rot * i);
     drawBranch(depth + 1, branchLen);
     popMatrix();
   }
}
