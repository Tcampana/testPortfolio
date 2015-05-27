Car[] myCars = new Car[100];

void setup() {
  size(500, 500);
  background(255);
  
  //constructor 2
  for (int i = 0; i < myCars.length; i++) {
    myCars[i] = new Car(random(width), random(height),3,color(255,0,0), random(10));
  }
}

void draw() {
  background(200);
  //draw cars
  for(int i = 0; i < myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}  

class Car {
  // member variablese
  int cLength, cHeight, cWeight, cSpeed;
  float xpos, ypos;
  color cColor;
  float left;

  //constructor #1
  Car (float tempX, float tempY, int tempColor) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color(random(255), random(255), random(255));
  }

  // constructor #2
  Car (float tempX, float tempY, int tempSpeed, 
  color tempColor, float tempLeft) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft;
  }

  // member methods
  void display () {
    rectMode (CENTER);
    fill(80);
    //Front wheels
    rect(xpos+13, ypos-10, 10, 3);
    rect(xpos+13, ypos+10, 10, 3);
    //Rear wheels
    fill(100);
    rect(xpos-15, ypos-10, 10, 3);
    rect(xpos-15, ypos+10, 10, 3);
    //car body
    fill (cColor);
    rect (xpos, ypos, 45, 20);
    //Windshield
    fill(220, 220, 255);
    rect(xpos+3, ypos, 10, 15);
    //
  }

  void drive() {
    if (left <= 1) {
      xpos+=cSpeed;
      //detect edge
      if (xpos > width) {
        xpos = 0;
      }
    } else { //Move some to the left, these cars are in reverse  
      xpos-=cSpeed-2;
      //detect edge
      if (xpos < 0) {
        xpos = width;
      }
    }
  }
} 





