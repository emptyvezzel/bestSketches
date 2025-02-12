import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;
float[] spectrum;
int bands = 512;
int numPetals = 12;
int symmetry = 6;
float time = 0;
float decay = 0.9;
float amp, angle, r, x, y, sum;

void setup(){
  size(800, 800, P3D);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 1024);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  spectrum = new float[bands];
  smooth();
}

void draw(){
  fft.forward(in.mix);
  for(int i = 0; i < bands; i++){
    spectrum[i] = max(spectrum[i] * decay, fft.getBand(i));
  }
  
  translate(width/2, height/2);
  background(0);
  amp = getAmplitude();
  for(int i = 0; i < symmetry; i++){
    angle = TWO_PI / symmetry * i;
    pushMatrix();
    rotate(angle);
    drawPetal();
    popMatrix();
  }
  
  time += 0.01;
}

void drawPetal(){
  beginShape();
  for(float t = 0; t < PI; t += 0.1){
    r = map(noise(t * 0.5, time), 0, 1, 50, 200) * (1 + amp * 2);
    x = r * cos(t);
    y = r * sin(t);
    stroke(lerpColor(color(255, 50, 150), color(50, 255, 200), sin(time + t)));
    strokeWeight(2);
    noFill();
    vertex(x, y);
  }
  endShape();
}
 
float getAmplitude(){
  sum = 0;
  for(int i = 0; i < bands; i++) sum += spectrum[i];
  return sum / bands;
}
