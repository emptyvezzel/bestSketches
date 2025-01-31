VectorField vField;
int unitPerSide=128;
int sizeCanvas=512;
float counter=0;
float convolveFactor;

void setup() {
  size(1000, 1000);
  //fullScreen();
  smooth();
  vField = new VectorField(unitPerSide, unitPerSide );
  vField.drawVectorField();
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);
  //convolveFactor = 0.01;
  vField.updateField();
  vField.drawVectorField();
  convolveFactor += 0.006;
}

class VectorField {
  PVector[][] field;
  PVector gridSize;
  float pStep;
  float pStepSize;
  float scaling= 2*sizeCanvas/unitPerSide;
  float decoherence = 0.02075;
  VectorField(int x, int y) {
    gridSize = new PVector(x, y);
    field = new PVector[x][y];
    pStep = 0.f;
    pStepSize = .01;
    updateField();
  }

  void updateField() {
  //counter=counter+ 0.0005; //sqrt(convolveFactor/10000)
  //pStep+=pStepSize;
    for (int i=0; i<gridSize.x; i++) {
      for (int j=0; j<gridSize.y; j++) {
        // float noisy= noise(i*decoherence + pStep, j*decoherence + pStep);
        float spacefun=sqrt (i * (gridSize.x-i) +  j *(gridSize.y-j) );
        float theta = (spacefun*  (convolveFactor)) ; //*noisy;// * sin(counter);// * (0.8 + noisy/5);
        float ampx =  sin(theta);
        field[i][j] = new PVector(ampx*scaling, ampx*scaling);
      }
    }
  }

  void drawVectorField() {
    for (int i=0; i<gridSize.x; i++) {
      for (int j=0; j<gridSize.y; j++) {
        float myx=(i+0.5)*width/gridSize.x;
        float myy=(j+0.5)*height/gridSize.y;
        noStroke(); //(255);
        fill(255);
        //fill((3.5*(field[i][j].x*field[i][j].y))%255, 255, 255);
        fill(30*field[i][j].y, 100*field[i][j].y, 100*field[i][j].y, 200);
        //strokeWeight(2.6);
        ellipse(myx, myy, field[i][j].x, field[i][j].y);
      }
    }
  }
}
