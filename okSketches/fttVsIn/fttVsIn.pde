import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
FFT fft;
int xPos0;
int xPos1;
int sensitivity;
float space;

void setup() {
  size(800, 800);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw() {
  background(0); 
  stroke(255);
  xPos0 = height/4;
  xPos1 = 3*(height/4);
  sensitivity = 1000;
  fft.forward(in.mix);
  space = 1;
  for (float i = 0; i < in.bufferSize() - 1; i += space) {
    stroke(i/2, 255, 255);
    line(i, xPos0 + in.left.get(round(i))*sensitivity, i+1, xPos0 - in.left.get(round(i))*sensitivity);
    line(i, xPos1 + fft.getBand(round(i*0.50))*sensitivity/2, i+1, xPos1 - fft.getBand(round(i*0.50))*sensitivity/2);
  }
}
