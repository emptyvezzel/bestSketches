import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  player = minim.loadFile("ambient_track.FLAC");
  player.play();
  fft = new FFT(player.bufferSize(), player.sampleRate());
}

void draw() {
  background(0);
  fft.forward(player.mix);
  for (int i = 0; i < fft.specSize(); i++) {
    float x = map(i, 0, fft.specSize(), 0, width);
    float h = -height + map(fft.getBand(i), 0, 1, height, 0);
    rect(x, height, width/fft.specSize(), h);
  }
}
