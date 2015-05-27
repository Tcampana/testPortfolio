Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
Button[] spButtons = new Button[1];
String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float valueToComputeI3 = 0;
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(400, 460);
  background(200);
  frameRate(25);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(1, 1, 327, 327);

  numButtons[0] = new Button(40, 360).asNumber(0, 40, 40);
  numButtons[1] = new Button(40, 300).asNumber(1, 40, 40);
  numButtons[2] = new Button(100, 300).asNumber(2, 40, 40);
  numButtons[3] = new Button(160, 300).asNumber(3, 40, 40);
  numButtons[4] = new Button(40, 240).asNumber(4, 40, 40);
  numButtons[5] = new Button(100, 240).asNumber(5, 40, 40);
  numButtons[6] = new Button(160, 240).asNumber(6, 40, 40);
  numButtons[7] = new Button(40, 180).asNumber(7, 40, 40);
  numButtons[8] = new Button(100, 180).asNumber(8, 40, 40);
  numButtons[9] = new Button(160, 180).asNumber(9, 40, 40);
  opButtons[0] = new Button(220, 240).asOperator("+");
  opButtons[1] = new Button(220, 300).asOperator("-");
  opButtons[2] = new Button(220, 360).asOperator("=");
  opButtons[3] = new Button(220, 180).asOperator("*");
  opButtons[4] = new Button(220, 120).asOperator("/");
  opButtons[5] = new Button(220, 420).asOperator("±");
  opButtons[6] = new Button(280, 180).asOperator("√");
  opButtons[7] = new Button(280, 120).asOperator("x²");
  opButtons[8] = new Button(280, 240).asOperator("xy");
  opButtons[9] = new Button(280, 300).asOperator("Rnd");
  opButtons[10] = new Button(280, 360).asOperator("C");
  spButtons[0] = new Button(160, 360).asSpecial(".");
  firstNum = true;
}

void draw() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }


  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
  }

  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();

  //  for (int i=0; i<spButtons.length; i++) {
  //    Button iSpButton = spButtons[i];
  //    iSpButton.display();
  //    if (iSpButton.overBox) {
  //      if (iSpButton.spButtonValue == ".") {
  //        if (iSpButton.overBox && firstNum == true) {
  //          valueToCompute += iSpButton.spButtonValue;
  //          displayValue = valueToCompute;
  //        } else if (iSpButton.overBox && firstNum == false) {
  //          valueToCompute2 += iSpButton.spButtonValue;
  //          displayValue = valueToCompute2;
  //        }
  //      }
  //    }
  //  }
}

void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);


  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '√') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sqrt(valueToComputeI2);
      displayValue = str(valueToComputeI2);
    }
  }else if (opValue == 'x') {
    if (firstNum) {
      valueToComputeI = sq(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sq(valueToComputeI2);
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'y') {
    if (firstNum) {
      //valueToComputeI = pow(valueToComputeI);
      //displayValue = str(valueToComputeI);
    } else {
      //valueToComputeI2 = pow(valueToComputeI2);
      //displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'r') {
    if (firstNum) {
      valueToComputeI = round(valueToComputeI);
      println(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = round(valueToComputeI2);
      displayValue = str(valueToComputeI2);
    }
  }

//  if (firstNum) {
//    valueToComputeI = valueToComputeI*-1;
//    displayValue = str(valueToComputeI);
//  } else {
//    valueToComputeI2 = valueToComputeI2*-2;
//    displayValue = str(valueToComputeI);
//  }  
//
//  if (firstNum) {
//    valueToCompute = displayValue;
//  } else {
//    valueToCompute = displayValue;
//    valueToCompute2 = "";
//  }
}


void updateDisplay() {
  fill(0);
  rect(10, 10, 310, 35, 7);
  fill(255);
  textSize(25);
  text(displayValue, 20, 37);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons [i];
    inumButton.clickButton();
    if (inumButton.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.clickButton();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "Rnd") {
        opValue = 'r';
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "/") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "*") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "√") {
        if (result != 0) {
          opValue = '√';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "√";
        } else {
          opValue = '√';
          firstNum = false;
          displayValue = "√";
        }
      } else if (iOpButton.opButtonValue == "x²") {
        if (result != 0) {
          opValue = 'x';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "x²";
        } else {
          opValue = 'x';
          firstNum = false;
          displayValue = "x²";
        }
      } else if (iOpButton.opButtonValue == "pow") {
        if (result != 0) {
          opValue = 'y';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "xy";
        } else {
          opValue = 'y';
          firstNum = false;
          displayValue = "pow";
        }
      }  else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "±") {
        opValue = 'n';
        performCalculation();
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.clickButton();
    if (iSpButton.overBox) {
      if (iSpButton.spButtonValue == ".") {
        if (iSpButton.overBox) {
        } 

        valueToCompute += iSpButton.spButtonValue;
        displayValue = valueToCompute;
      } else if (iSpButton.overBox && firstNum == false) {
        valueToCompute2 += iSpButton.spButtonValue;
        displayValue = valueToCompute2;
      }
    }
  }
}





void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute +=keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue=valueToCompute2;
  }
}

class Button {
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW = 40;
  int buttonH = 40;
  boolean overBox = false;


  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
  }

  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  Button asOperator(String tempOpButtonValue) {
    opButtonValue = tempOpButtonValue;
    buttonW = 40;
    buttonH = 40;
    return this;
  }

  Button asSpecial(String buttonValue) {
    isSpecial = true;
    spButtonValue = buttonValue;
    return this;
  }  

  void display() {
    if (isNumber) {
      fill(200, 200, 0);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(11, 11, 11);
      textSize(24);
      text(int(numButtonValue), xpos+15, ypos+30);
    } else if (isSpecial) {
      fill(77, 177, 177);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+30);
    } else if (opButtonValue == "+") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+9, ypos+29);
    } else if (opButtonValue == "-") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+12, ypos+28);
    } else if (opButtonValue == "=") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+9, ypos+29);
    } else if (opButtonValue == "*") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+9, ypos+29);
    } else if (opButtonValue == "/") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+9, ypos+29);
    } else if (opButtonValue == "±") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(30);
      text(opButtonValue, xpos+9, ypos+29);
    } else if (opButtonValue == "√") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(16);
      text(opButtonValue, xpos+5, ypos+21);
    } else if (opButtonValue == "x²") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(16);
      text(opButtonValue, xpos+5, ypos+21);
    } else if (opButtonValue == "xy") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(16);
      text(opButtonValue, xpos+5, ypos+21);
    } else if (opButtonValue == "Rnd") {
      fill(222, 22, 22);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(16);
      text(opButtonValue, xpos+5, ypos+21);
    } else if (opButtonValue == "C") {
      fill(255);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 7);
      fill(0);
      textSize(16);
      text(opButtonValue, xpos+5, ypos+21);
    }
  }

  void clickButton() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}


