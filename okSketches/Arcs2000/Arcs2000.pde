// made by Jack Murphy / emptyvezzel

//import processing.video.*;
//Capture video;
float zoom = 1.0;
float bx = 50;
float by = 20;
float bz = 40;
float bend = 0;
int objnum = 1;
int armnum = 1;
int boxnum = 15;
int straightvar = 0;
int monovar = 0;
int shapevar = 0;
int noisevar = 0;
int lightvar = 0;
int darkvar = 0;
int m = 100;
int sinedepth = 1;
int y = 0;
int col1a = 0;
int col1b = 255;
int col2a = 0;
int col2b = 255;
int col3a = 0;
int col3b = 255;
int outline = 0;
int randnum = 1;
int backcol = 0;
int randomint = 1;
int backtoggle = 0;
int linetoggle = 0;
int transnum = 250;
int spaceval = 60;
int randtoggle = 0;
int detailvar = 0;

void setup() {
  //video = new Capture(this, 640, 480, 30);
  //video.start();
  noCursor();
  fullScreen(P3D);
}

void draw() {
  //video.read();
  //image(video, 0, 0, width, height);
  if (objnum < 0) {
    objnum = 0;
  }
  if (armnum < 0) {
    armnum = 0;
  }
  if (boxnum < 0) {
    boxnum = 0;
  }
  if ((backtoggle & 1) == 0) {
    if ((backcol & 1) == 0) { 
      //background(0);
    } else {
      //background(255);
    }
  }
  stroke(0);
  translate(width/2, height/2);
  scale(zoom);
  rotateY(radians(mouseX)); 
  rotateX(radians(mouseY));
  for (int p = 0; p<objnum; p++) {
    translate(0, 0, -transnum);
    for (int a = 0; a<armnum; a++) {
      rotate(radians(360.0/armnum+y));
      for (int i = 0; i < boxnum; i++) {
        pushMatrix();
        if ((straightvar & 1) == 0) {
          if ((noisevar & 1) == 0) {
            translate((spaceval - i*1)*i, sin(i+frameCount/10.0)*(30+sinedepth), i*bend);
          } else {
            translate((spaceval - i*1)*i, noise(sin(i+frameCount/10.0))*m, i*bend);
          }
        } else {
          translate((spaceval - i*1)*i, 0, i*bend);
        }
        scale(1.0 - i*0.05);
        if ((monovar & 1) == 0) {
          if ((randtoggle & 1) == 0){
            fill(random(col1a, col1b), random(col2a, col2b), random(col3a, col3b));
          } else {
            fill((col1b - col1a), (col2b - col2a), (col3b - col3a));
          }
        } else {
          fill(random(0, 255));
        }
        if ((shapevar & 1) == 0) {
          if ((outline & 1) == 0) {
            if ((linetoggle & 1) == 0) {
              stroke(255);
            } else {
              stroke(0);
            }
          } else {
            noStroke();
          }
          box(bx, by, bz);
        } else {
          if ((outline & 1) == 0) {
            if ((linetoggle & 1) == 0) {
              stroke(255, 50);
            } else {
              stroke(0);
            }
          } else {
            noStroke();
          }
          sphereDetail(5+detailvar);
          sphere(bx/2);
        }
        if (col1a > col1b) {
          col1a = 0;
          col1b = 255;
        }
        if (col2a > col2b) {
          col2a = 0;
          col2b = 255;
        }
        if (col3a > col3b) {
          col3a = 0;
          col3b = 255;
        }
        if (col1a < 0) {
          col1a = 0;
        }
        if (col2a < 0) {
          col2a = 0;
        }
        if (col3a < 0) {
          col3a = 0;
        }
        if (col1b > 255) {
          col1b = 255;
        }
        if (col2b > 255) {
          col2b = 255;
        }
        if (col3b > 255) {
          col3b = 255;
        }
        popMatrix();
      }
    }
  }
}

void keyPressed() {
  if (keyCode == UP) zoom += 0.2; //zoom in
  if (keyCode == DOWN) zoom -= 0.2; //zoom out
  if (key == 'r') { 
    //randomize box size
    bx = random(10, 100);
    by = random(10, 100);
    bz = random(10, 100);
  }
  if (keyCode == RIGHT) {
    //increase box size
    bx += 10;
    by += 10;
    bz += 10;
  }
  if (keyCode == LEFT) {
    //increase box size
    bx -= 10;
    by -= 10;
    bz -= 10;
  }
  if (key == 'm') boxnum += 1; //more boxes
  if (key == 'n') boxnum -= 1; //less boxes
  if (key == 'q') bend += 10; //increase bend
  if (key == 'a') bend -= 10; //decrease bend
  if (key == 'w') armnum += 1; //more arms
  if (key == 's') armnum -= 1; //less arms
  if (key == 'e') objnum += 1; //plus 1 object
  if (key == 'd') objnum -= 1; //minus 1 object
  if (key == '=') spaceval += 10; //increase space between boxes
  if (key == '-') spaceval -= 10; //decrease space between boxes
  if (key == ',') transnum += 50; //increase rotation axis
  if (key == '.') transnum -= 50; //decrese rotation axis
  if (key == 'b') straightvar += 1; //arms become straight
  if (key == 'z') monovar += 1; //switches monochrome on and off
  if (key == 'c') shapevar += 1; //alternates between 2D circles and 3D boxes
  if (key == 'v') noisevar += 1; //arms wiggle slightly (noise)
  if (key == '[') sinedepth += 10; //increase sine depth
  if (key == ']') sinedepth -= 10; //decrease sine depth
  if (key == ' ') outline += 1; //toggle outline
  if (key == '\\') backcol += 1; //toggle background color
  if (key == TAB) backtoggle += 1; //toggle background
  if (key == 'x') linetoggle += 1; //toggle outline color+
  if (key == '*') detailvar += 1;
  if (key == '+') detailvar -= 1;
  if (key == '1') {
    //red
    col1a = 0;
    col1b = 255;
    col2a = 0;
    col2b = 0;
    col3a = 0;
    col3b = 0;
  }
  if (key == '2') {
    //green
    col1a = 0;
    col1b = 0;
    col2a = 0;
    col2b = 255;
    col3a = 0;
    col3b = 0;
  }
  if (key == '3') {
    //blue
    col1a = 0;
    col1b = 0;
    col2a = 0;
    col2b = 0;
    col3a = 0;
    col3b = 255;
  }
  if (key == '4') {
    //green + blue
    col1a = 0;
    col1b = 0;
    col2a = 0;
    col2b = 255;
    col3a = 0;
    col3b = 255;
  }
  if (key == '5') {
    //blue + red
    col1a = 0;
    col1b = 255;
    col2a = 0;
    col2b = 0;
    col3a = 0;
    col3b = 255;
  }
  if (key == '6') {
    //red + green
    col1a = 0;
    col1b = 255;
    col2a = 0;
    col2b = 255;
    col3a = 0;
    col3b = 0;
  }
  if (key == '7') {
    //light colors (pastel)
    //col1a = 125;
    //col1b = 255;
    //col2a = 125;
    //col2b = 255;
    //col3a = 125;
    //col3b = 255;
    col1a = col1a*2;
    col1b = col1b*2;
    col2a = col2a*2;
    col2b = col2b*2;
    col3a = col3a*2;
    col3b = col3b*2;
    if (col1a < 125) col1a = 125;
    if (col1b > 255) col1b = 255;
    if (col2a < 125) col2a = 125;
    if (col2b > 255) col2b = 255;
    if (col3a < 125) col3a = 125;
    if (col3b > 255) col3b = 255;
  }
  if (key == '8') {
    //dark colors (muddy)
    //col1a = 0;
    //col1b = 125;
    //col2a = 0;
    //col2b = 125;
    //col3a = 0;
    //col3b = 125;
    col1a = col1a/2;
    col1b = col1b/2;
    col2a = col2a/2;
    col2b = col2b/2;
    col3a = col3a/2;
    col3b = col3b/2;
    if (col1a < 0) col1a = 0;
    if (col1b > 125) col1b = 125;
    if (col2a < 0) col2a = 0;
    if (col2b > 125) col2b = 125;
    if (col3a < 0) col3a = 0;
    if (col3b > 125) col3b = 125;
  }
  if (key == '`') {
    //random colors
    col1a = 0;
    col1b = 255;
    col2a = 0;
    col2b = 255;
    col3a = 0;
    col3b = 255;
  }
  if (key == '0') {
    //black
    col1a = 255;
    col1b = 255;
    col2a = 255;
    col2b = 255;
    col3a = 255;
    col3b = 255;
  }
  if (key == '9') {
    //white
    col1a = 0;
    col1b = 0;
    col2a = 0;
    col2b = 0;
    col3a = 0;
    col3b = 0;
  }
  //manual color adjustments:
  if (key == 't') col1a -= 10;
  if (key == 'g') col1a += 10;
  if (key == 'y') col2a -= 10;
  if (key == 'h') col2a += 10;
  if (key == 'u') col3a -= 10;
  if (key == 'j') col3a += 10;
  if (key == 'i') col1b -= 10;
  if (key == 'k') col1b += 10;
  if (key == 'o') col2b -= 10;
  if (key == 'l') col2b += 10;
  if (key == 'p') col3b -= 10;
  if (key == ';') col3b += 10;
  if (key == 'f') randtoggle += 1;
}
