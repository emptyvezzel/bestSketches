int n = 200;
float [] angle = new float [n];
float [] tarAng = new float [n];
PVector [] pos = new PVector [n];
PVector [] cols = new PVector [n];

void setup() {
  fullScreen(P3D);
  //size(600, 600, P3D);
  background(255);
  for (int i = 0; i < n; i++){
    angle[i] = random(TWO_PI);
    tarAng[i] = random(TWO_PI);
    float c = random(255);
    cols[i] = new PVector(c, c, c);
    pos[i] = new PVector(0,0, -i*30);
  }
}
float da=1;
void draw(){
  background(250);
  directionalLight(255,255,255,0,1,-1);
  noStroke();
  
  for(int i = 0; i < n; i++){
    float a = angle[i];
    PVector c = cols[i];
    translate(300,300);
    angle[i] = lerp(angle[i], tarAng[i], 0.001);
    
    if(abs(a-tarAng[i]) < 0.2)
      tarAng[i] = random(TWO_PI);
      rotate(a);
      translate(-300, -300);
      fill(c.x,c.y,c.z,200);
      pushMatrix();
      translate(300,300,pos[i].z);
      drawArc(a, 200);
      
      popMatrix();
    pos[i].z+=da;
  }
}

void drawArc(float a, float r){
  for(float w = 0; w < a; w+= 0.1){
    pushMatrix();
    rotate(w);
    translate(0,r);
    box(20,100,20);
    popMatrix();
  }
}
