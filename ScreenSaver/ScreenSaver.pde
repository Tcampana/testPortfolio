Lines[] myLines = new Lines [10];

void setup() {
  frameRate(30);
  background(random(100, 150));
  size(500, 400);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}

void draw() {
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
  if (frameCount > 200) {
    background(random(30, 150));
    frameCount = 0;
  }
  println(frameCount);
}

class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  void display() {
    strokeW = random(3, 9);
    lineLength = random(2, 30);
    stroke(random(200), random(100), random(30));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>65) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>65) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveUpRight(xpos, ypos, lineLength);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveDownRight(xpos, ypos, lineLength);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveUpLeft(xpos, ypos, lineLength);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveDownLeft(xpos, ypos, lineLength);
      }
    }
  }  

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }  

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }  

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY + i;
    }
  }  

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY - i;
    }
  }

  void moveUpRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      xpos = startX + i;
      ypos = startY + i;
    }
  }
  
  void moveUpLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      xpos = startX - i;
      ypos = startY + i;
    }
  }
  
  void moveDownRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX + i;
      ypos = startY - i;
    }
  }
  
  void moveDownLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX - i;
      ypos = startY - i;
    }
  }
}


