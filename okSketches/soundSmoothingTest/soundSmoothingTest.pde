import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
int xPos;
int sensitivity;
float decSpeed;
float space;
float[] peakArray = new float[1024];
int[] peakFrame = new int[1024];
float pureIn;

void setup() {
  size(800, 800);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
  for(int i = 0; i < peakFrame.length; i++) peakFrame[i] = 0;
}

void draw() {
  background(0); 
  stroke(255);
  xPos = height/2;
  sensitivity = 1000;
  space = 1;
  decSpeed = 1.0;
  for (float i = 0; i < in.bufferSize() - 1; i += space) {
    stroke(i%255, 255, 255);
    pureIn = in.left.get(round(i))*sensitivity;
    if(peakArray[round(i)] < pureIn) peakArray[round(i)] = in.left.get(round(i))*sensitivity;
    line(i, xPos + peakArray[round(i)], i+1, xPos - peakArray[round(i)]);
  }
  for(int i = 0; i < peakArray.length; i++){
    if(peakArray[i] > 0){
        peakArray[i] -= decSpeed;
    }
  }
  println(frameRate);
}
