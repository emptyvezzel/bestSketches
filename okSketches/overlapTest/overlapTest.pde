PGraphics c;
PGraphics d;
int size = 50;

void setup() {
  size(300, 300);
  background(255);
  c = createGraphics(width, height, JAVA2D);
  d = createGraphics(width, height, JAVA2D);
  c.beginDraw();
  c.smooth();
  c.endDraw();
  d.beginDraw();
  d.smooth();
  d.endDraw();
}

void draw() {
  noStroke();
  size = 200;
  background(0);
  c.beginDraw();
  c.background(0, 0);
  c.fill(255);
  c.ellipse(mouseX, mouseY, size, size);
  c.endDraw();

  d.beginDraw();
  d.background(0, 0);
  d.fill(255);
  d.ellipse(width/2, height/2, size, size);
  d.endDraw();
  d.blend(c, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
  image(d, 0, 0);
}
