import ddf.minim.*;
Minim minim;
AudioInput in;
float variableInt = 50;
float sensitivity;
float colInc;
float sizeInc = 0.5;

void setup() {
  size(500, 500);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  colInc += 0.5;
  if(variableInt > 50 || variableInt < 10) sizeInc *= -1;
  variableInt -= sizeInc;
  sensitivity = 300;
  stroke(colInc%255, 255, 255);
  for (int j = 0; j < width - variableInt; j+=variableInt) {
    for (int i = 0; i < in.bufferSize() - 1; i++) {
      line(i, variableInt + j + in.left.get(i)*sensitivity, i+1, variableInt + j + in.left.get(i+1)*sensitivity);
      line(variableInt + j + in.left.get(i)*sensitivity, i, variableInt + j + in.left.get(i+1)*sensitivity, i+1);
    }
  }
}
