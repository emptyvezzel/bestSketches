Particle[] particles;
float alpha;

void setup() {
  size(900, 900);
  background(0);
  noStroke();
  setParticles();
}

void draw() {
  alpha = map(-7, 0, width, 5, 35);
  fill(0, alpha);
  rect(0, 0, width, height);
  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[30000];
  for (int i = 0; i < 30000; i++) { 
    float x = random(width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
   // int c = color(40, adj, 255);
     int c = color(random(0, 255), random(0, 255), random(0, 255));
    particles[i]= new Particle(x, y, c);
  }
}

void mousePressed() {
  setParticles();
}

class Particle {
  float posX, posY, incr, theta;
  color  c;

  Particle(float xIn, float yIn, color cIn) {
    posX = xIn;
    posY = yIn;
    c = cIn;
  }

  public void move() {
    update();
    wrap();
    display();
  }

  void update() {
    incr +=  0.008;
    theta = noise(posX * 0.006, posY * 0.004, incr) * TWO_PI;
    posX += 2 * cos(theta);
    posY += 2 * sin(theta);
  }

  void display() {
    if (posX > 0 && posX < width && posY > 0  && posY < height) {
      pixels[(int)posX + (int)posY * width] =  c;
    }
  }

  void wrap() {
    if (posX < 0) posX = width;
    if (posX > width ) posX =  0;
    if (posY < 0 ) posY = height;
    if (posY > height) posY =  0;
  }
}
