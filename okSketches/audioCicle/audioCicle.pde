import java.util.ArrayList;
import ddf.minim.*;
Minim minim;
AudioInput in;
int xPos;

int circAmt = 20;
double step = 2*Math.PI/20;
float x;
float y;
int h = 150; 
int k = 150;
int r = 50;
ArrayList<Float>circValX = new ArrayList();
ArrayList<Float>circValY = new ArrayList();

void setup() {
  size(800, 800);  
  background(0); 
  stroke(255);
  //minim = new Minim(this);
  //in = minim.getLineIn();
}

void draw() {
  background(0); 
  stroke(255);
  //xPos = 50;

  //for(int i = 0; i < in.bufferSize() - 1; i++){
  //  pushMatrix();
  //  line(i, xPos + in.left.get(i)*50, i+1, xPos + in.left.get(i+1)*50);
  //  popMatrix();
  //}
  circAmt = 89;
  //step = 2*Math.PI/414;  
  h = 400; 
  k = 400;
  r = 296;

  if (circAmt == 0) circAmt = 1;
  for (double i = 0; i < 2*Math.PI; i += 2*Math.PI/abs(circAmt)) { 
    x = h + r*(float)Math.cos(i);
    y = k - r*(float)Math.sin(i);    
    line(x, y, x, y);
    circValX.add(x);
    circValY.add(y);
  }
  if (circAmt > 1) {
    for (int i = 0; i < circAmt-1; i++) {
      line(circValX.get(i), circValY.get(i), circValY.get(i+1), circValY.get(i+1));
    }
  }
}
