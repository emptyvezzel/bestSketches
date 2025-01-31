
/**
 key input:
 <blanc>  select random thorn fractal
 1..7    select predefined thorn fractal
 c     set random sinus colors
 r     set random noisy colors
 g     set gray scaled colors
 p     toggle palette drawing
 i     toggle information display
 k     toggle zoom
 m     change pixel multi sampling (time*16)
 s     save "ThornFractal#.png"
 +/-    change escape value
 */

boolean useMultiSampling = false;
boolean showPalette = false;
boolean showInfo = true;
int picNr = 1;
float colChangeNum = 0.1;

void setup(){
  size(600, 600);
  setRandomThornData();
  randomColorPalette();
  fill(0);
  noiseDetail(1, 0.099);
}

void draw(){
  drawThornFractal();
}

void keyPressed(){
  if (key == '1') setThornData(0.102, -0.04);
  else if (key == '2') setThornData(1.098, 1.402);
  else if (key == '3') setThornData(9.984, 7.550);
  else if (key == '4') setThornData(0.662, 1.086);
  else if (key == '5') setThornData(-0.354, 0.162);
  else if (key == '6') setThornData(5.9375, 5.15625);
  else if (key == '7') setThornData(-2*PI, 2*PI);
  else if (key == ' ') setRandomThornData();
  else if (key == 'i') showInfo = !showInfo;
  else if (key == 'c') noisyColorPalette();
  else if (key == 'r') randomColorPalette();
  else if (key == 'm') changeMultiSampling();
  else if (key == '+') changeEscapeValue(+100);
  else if (key == '-') changeEscapeValue(-100);
  else if (key == 'k') if (ymax==PI) ymax = 0; 
  else ymax = PI;
  else if (key == 'z') zoomIn();
  else if (key == 'x') zoomOut();
}
//---------------------------------------------------------------
void mousePressed(){
  println ("mouse="+mouseX+","+mouseY);
  setThornData (mouseX*20.0/ width -10, mouseY * 20.0 / height-10.0);
}

color[] col = new color[256];

public void randomColorPalette(){
  println("randomColorPalette:");
  float deltax = 1;
  for (int ci=0; ci<256; ci++)
  {
    col[ci] = color(127+127*cos(    frameCount+deltax*0.022)
      , 127-127*sin( 55+frameCount+deltax*0.049)
      , 127-127*sin(155+frameCount+deltax*0.075));
    deltax *= 0.996;
    deltax += 2;
  }
}
//---------------------------------------------------------------
float xnoise = 0.0;
//---------------------------------------------------------------
void noisyColorPalette()
{
  println("noisyColorPalette:");
  float deltax = 0.1;
  //  final float mf = 455;  // Java mode
  final float mf = 2888; // JavaScript mode
  for (int ci=0; ci<256; ci++)
  {
    xnoise = xnoise + deltax;
    deltax *= 0.99;
    col[ci] = color (min(255, int (mf * noise(xnoise)))
      , min(255, int (mf * noise(xnoise+33)))
      , min(255, int (mf * noise(xnoise+77))));
  }
}
//---------------------------------------------------------------
void drawColorPalette()
{
  noStroke();
  fill (0);
  rect(0, height -277, width, height);
  for (int ci=0; ci<256; ci++)
  {
    noStroke();
    fill (col[ci]);
    rect (ci*2-2, height-20, ci*2, height-1);
    stroke(255, 50, 50);  
    point(ci*2, height-22-red(col[ci]));
    stroke(50, 255, 50);  
    point(ci*2, height-22-green(col[ci]));
    stroke(50, 50, 255);  
    point(ci*2, height-22-blue(col[ci]));
  }
}

//===============================================================
//  thorn data handling
//===============================================================

float escapeValue = 10000.0;
float xmin = -PI*0.5;
float xmax = +PI*0.5;
float ymin = -PI;
float ymax = +PI;

float cr, ci;     // constant real/imag
int multiSampleX = 1;   // 1..8
int multiSampleY = 1;   // 1..8
float multms = 8.0 / (multiSampleX * multiSampleY);

//---------------------------------------------------------------
void setThornData(float v1, float v2)
{
  println("setThornData: " + v1 + ", " +v2);
  ci = v1;
  cr = v2;
  frameCount = 1;
}
//---------------------------------------------------------------
void setRandomThornData()
{
  setThornData(random(-10, 10), random(-10, 10));
  //  setThornData(random(-1,1),random(-1,1));
}
//---------------------------------------------------------------
void changeMultiSampling()
{
  multiSampleX *= 2;  
  if (multiSampleX > 8) multiSampleX = 1;
  multiSampleY += 1;  
  if (multiSampleY > 4) multiSampleY = 1;
  useMultiSampling = multiSampleX > 1;
  println ("MultiSampling: " + multiSampleX +"*" + multiSampleY);
}
//---------------------------------------------------------------
void changeEscapeValue(int delta)
{
  println("escape value = " + round(escapeValue));
  escapeValue = constrain(escapeValue + delta, 100, 30000);
}
//---------------------------------------------------------------
void zoomIn(){
  xmin += (xmax-xmin)*0.25;   
  xmax -= (xmax-xmin)*0.25;
  ymin += (ymax-ymin)*0.25;   
  ymax -= (ymax-ymin)*0.25;
}

void zoomOut(){
  xmin -= (xmax-xmin)*0.25;   
  xmax += (xmax-xmin)*0.25;
  ymin -= (ymax-ymin)*0.25;   
  ymax += (ymax-ymin)*0.25;
}

void drawThornFractal(){
  int iterations = 10;
  float ir, ii, k, zi, zr, a, b;
  int px = width;
  int py = height;
  multms = 8.0;
  if (useMultiSampling){ 
    px *= multiSampleX;   // horizontal pixels
    py *= multiSampleY;   // vertical pixels
    multms = 8.0 / (multiSampleX * multiSampleY);
  }
  float cx = cr + cos(frameCount * 0.05);
  float cy = ci + sin(frameCount * 0.05);
  float[] sum = new float[width];   // line with value summaries
  int pixelOffset = 0;
  loadPixels();    
  for (int y=0; y < py; y++){
    zr = ymin + y * (ymax - ymin) / py;
    for (int x=0; x<px; x++){
      zi = xmin + x * (xmax - xmin) / px;
      ir = zr;
      ii = zi;
      for (k=0; k < iterations; k++){
        a = ir;
        b = ii;
        // default formula
        ir = a / cos(b) + cx;
        ii = b / sin(a) + cy;
        // variant 1
        //        ir = a/cos(b)*sin(b) +cx;
        //        ii = b/sin(a)*cos(a) +cy;
        // variant 2
        //        ir = a / sin(cos(b) * sin(b)) + cx;
        //        ii = b / cos(sin(a) * cos(a)) + cy;
        if (ir*ir + ii*ii > escapeValue)
          break;
      }
      if (useMultiSampling)
        sum[x/multiSampleX] += k;
      else pixels[pixelOffset++] = col[round(k*abs(colChangeNum))%256];
    }

    if (useMultiSampling)
      if ( (y % multiSampleY) == 0)
      {
        for (int ni=0; ni<width; ni++)
        { 
          pixels[pixelOffset++] = col[round(sum[ni]*multms)%256];
          sum[ni] = 0.1;
        }
      }
  }
  updatePixels();
  colChangeNum += 0.070;
}
