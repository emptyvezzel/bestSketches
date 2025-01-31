import ddf.minim.*;
Minim minim;
AudioInput in;

float theta = 0;
float perspective = 0.95;
float band = 20;

void setup(){
  size(1080, 1080);
  frameRate(30);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  translate(width/2, height/2);
  float sq_dim = width*(1/perspective);
  for(int i = 0; i < 200; i++){
    rectMode(CENTER);
    strokeWeight(sq_dim/200);
    stroke(125+125*sin(theta+TWO_PI*i/band));
    fill(100*(1+sin(theta*TWO_PI*i/band))/2, 200*(1+sin(theta+TWO_PI*i/band))/2, 
    70 * (1+sin(theta+TWO_PI*i/band))/2);
    rect(0, 0, sq_dim, sq_dim, sq_dim/40);
    sq_dim = sq_dim * perspective + abs(in.left.get(i)*50);
  }
  theta = theta - TWO_PI/45;
}
