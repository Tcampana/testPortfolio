void setup() {
  size(740,400);
}

void draw() {
  background(255);
  drawReference(0,50);
  float mile = mileConverter(mouseX);
  float km = kmConverter(mouseX);
  rect(0,50,mouseX,50);
  fill(0);
  text(mile,100,15);
  text("Miles:",30,15);
  text(km, 100,25);
  text("Kilometers:",30,25);
}

float mileConverter(float km) {
  float miles = km * .62137;
  return miles;
}

float kmConverter(float mile) {
  float km = mile * 1;
  return km;
}  

void drawReference (int xpos, int ypos) {
  stroke(200);
  line(xpos-50, ypos, 900, ypos);
  for(int i = 0; i<800; i=i+50) {
    text(i, xpos+i-8, ypos);
    line(xpos+i, ypos, xpos +i, ypos+5);
  }
}  

