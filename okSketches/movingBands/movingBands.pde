Blob[] blob = new Blob[30];

void setup() {
  size(400, 400);
  for(int i = 0; i < blob.length;i++){
    blob[i] = new Blob(100);
  }
}

void draw() {
  translate(width / 2, height / 2);
  background(0);
  for(int i = 0; i < blob.length; i++){
    blob[i].display(i*9);
  }
}
