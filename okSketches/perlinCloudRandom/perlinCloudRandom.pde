float x,y;
int rows,cols;
float zoom;
float angle;
float red,green,blue;

void setup(){
    size(800,800);
    rows = width/16;
    cols = height/16;
    zoom = 70;
    angle = 0;
    red = random(255);
    green = random(255);
    blue = random(255);
}

void draw(){
    background(0);
    noStroke();
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            float n = noise(i/zoom, j/zoom, angle);
            float newRed = red + n*200 - 100;
            float newGreen = green + n*200 - 100;
            float newBlue = blue + n*200 - 100;
            fill(newRed,newGreen,newBlue);
            rect(i*16,j*16,16,16);
        }
    }
    angle+=0.01;
}
