color[] c; 
float nx, ny, nz;
float theta = 0, phi = 0;
float R = 5, r = 1;

void setup() {
  size(800, 800);
  //img = createImage(2*width, 2*height, RGB);   
  c = new color[255];
  for (int i = 0; i < c.length; i += 1) {
    c[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  R = 5;
  //r = 1.00;
  r += 0.01;
  noiseDetail(1, 0.3);
  loadPixels();  
  for (int x = 0; x < width; x += 1) {
    for (int y = 0; y < height; y += 1) {
      // map x and y to angles between 0 and TWO_PI
      theta = map(x, 0, width, 0, TWO_PI);
      phi = map(y, 0, height, 0, TWO_PI);
      nx = (R+r*cos(phi))*cos(theta);
      ny = (R+r*cos(phi))*sin(theta);
      nz = r*sin(phi);
      nx = norm(nx, 0, R+r);
      ny = norm(ny, 0, R+r);
      nz = norm(nz, 0, r);
      pixels[x + y*width] = c[floor(255*noise(floor(255*noise(nx, ny, nz)), 0.1))];
    }
  }
  updatePixels();
  println(frameRate + " r value: " + r);
}
