int numVertices = 40;
int size = 100;
int variation = 10000;

void setup() {
  //size(400, 400);
  fullScreen();
  noStroke();
  colorMode(HSB, 360, 100, 100);
  newBack();
}

void draw() {
  // Use Perlin noise to calculate x and y positions
  float x = map(noise(frameCount * 0.01), 0, 1, 0, width);
  float y = map(noise(frameCount * 0.01 + 10000), 0, 1, 0, height);

  // Create a variable to store the number of vertices in the custom shape
  numVertices = 1000;
  size = 300;
  variation = 40;

  // Create arrays to store vertex positions
  float[] xPos = new float[numVertices];
  float[] yPos = new float[numVertices];

  // Use Perlin noise to calculate vertex positions
  for (int i = 0; i < numVertices; i++) {
    xPos[i] = map(noise(frameCount * 0.01 + 20000 + i * variation), 0, 1, x - size, x + size);
    yPos[i] = map(noise(frameCount * 0.01 + 30000 + i * variation), 0, 1, y - size, y + size);
  }

  // Use Perlin noise to calculate hue, saturation, and brightness
  float hue = map(noise(frameCount * 0.01 + 40 * 10000), 0, 1, 0, 360);
  float sat = map(noise(frameCount * 0.01 + 40 * 10000 + 10000), 0, 1, 0, 100);
  float bri = map(noise(frameCount * 0.01 + 40 * 10000 + 20000), 0, 1, 0, 100);

  // Set the fill color using the calculated hue, saturation, and brightness
  fill(hue, sat, bri);

  // Draw a custom shape with changing vertices at the calculated position
  beginShape();
  vertex(x, y);
  for (int i = 0; i < numVertices; i++) {
    vertex(xPos[i], yPos[i]);
  }
  endShape(CLOSE);
}

void newBack(){
  background(random(0, 255), random(0, 100), random(0, 100));
}
