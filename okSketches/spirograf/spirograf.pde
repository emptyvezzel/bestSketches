float t=0;               //angle
float speed = 0.01;      //rotationspeed
float dotSize = 2;       //dot size

void setup() {
  size(800,800);
}

void draw() {
  background(0);
  for (int i=1; i<21; i+=2) {
    spirograph(800, 600, i*10, 100, 3, -1);
  }  
  t+=speed;
}

void spirograph(float radGr, float radKl, float entfRadKl, int dot, int loop, int direction) {
  float R = radGr;        //radius big circle
  float r = radKl;        //radius small circle
  float a = entfRadKl;    //distance to middle r
  int dots = dot;         //amount of dots
  int loops = loop;       //factor, to close spirograph - (R/r)*loops mod 1 needs to equal 0 or something like this
  int dir = direction;    //rotation direction (and speed if < or > 1) – clockwise if negative
  colorMode(HSB, 100);

  for (float i = 0; i<TWO_PI*(R/r)*loops; i+=TWO_PI/dots) {
    float alpha = (r/R)*i;                      //angle in R
    float beta = (1-(r/R))*i+t*dir;             //angle in r
    float x1 = width/2+cos(alpha)*((R-r)/2);    //x position of r
    float y1 = width/2+sin(alpha)*((R-r)/2);    //y position of r
    float x2 = x1+cos(beta)*(a);                //x position of a
    float y2 = y1-sin(beta)*(a);                //y position of a
    noStroke();
    fill(100/(TWO_PI*(R/r)*loops)*i, 100, 100, 30);
    ellipse(x2, y2, dotSize*4, dotSize*4);
    fill(100);
    ellipse(x2, y2, dotSize, dotSize);
  }
}
