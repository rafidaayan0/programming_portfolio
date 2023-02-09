// Rafid Aayan | Nov 2022 | Calc Project

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;
PFont font1, font2, font3;
String dVal2 ="";
String lstr, lstr2, rstr = "";
float Ans = 0;

void setup() {
  size(300, 400);
  font1 = createFont("Helvetica", 70);
  font2 = createFont("Helvetica", 30);
  font3 = createFont("Helvetica", 20);
  numButtons[0] = new Button(40, 368, 80, 64, color(210), '0');
  numButtons[1] = new Button(40, 305, 80, 62, color(210), '1');
  numButtons[2] = new Button(120, 305, 80, 62, color(210), '2');
  numButtons[3] = new Button(200, 305, 80, 62, color(210), '3');
  numButtons[4] = new Button(40, 243, 80, 62, color(210), '4');
  numButtons[5] = new Button(120, 243, 80, 62, color(210), '5');
  numButtons[6] = new Button(200, 243, 80, 62, color(210), '6');
  numButtons[7] = new Button(40, 181, 80, 62, color(210), '7');
  numButtons[8] = new Button(120, 181, 80, 62, color(210), '8');
  numButtons[9] = new Button(200, 181, 80, 62, color(210), '9');

  opButtons[0] = new Button(120, 368, 80, 64, color(210), '.');
  opButtons[1] = new Button(200, 368, 80, 64, color(210), '±');
  opButtons[2] =  new Button(270, 375, 60, 50, color(255, 184, 17), '=');
  opButtons[3] =  new Button(270, 325, 60, 50, color(255, 184, 17), '+');
  opButtons[4] =  new Button(270, 275, 60, 50, color(255, 184, 17), '-');
  opButtons[5] =  new Button(270, 225, 60, 50, color(255, 184, 17), '×');
  opButtons[6] =  new Button(270, 175, 60, 50, color(255, 184, 17), '÷');
  opButtons[7] =  new Button(30, 125, 60, 50, color(255, 184, 17), 'A');
  opButtons[8] =  new Button(90, 125, 60, 50, color(255, 184, 17), 'π');
  opButtons[9] =  new Button(150, 125, 60, 50, color(255, 184, 17), 's');
  opButtons[10] =  new Button(210, 125, 60, 50, color(255, 184, 17), '√');
  opButtons[11] =  new Button(270, 125, 60, 50, color(255, 184, 17), 'C');
}

void draw() {
  background(0);
  textFont(font3);
  numButtons[0].display();
  numButtons[0].hover(mouseX, mouseY);
  opButtons[0].display();
  opButtons[0].hover(mouseX, mouseY);
  opButtons[1].display();
  opButtons[1].hover(mouseX, mouseY);
  for (int i=1; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=2; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  fill(29, 174, 245);
  rect(150, 50, 300, 100);
  fill(0);
  textAlign(RIGHT);
  textFont(font1);
  if (dVal.length() < 8) {
    textSize(70);
  } else if (dVal.length() < 9) {
    textSize(65);
  } else if (dVal.length() < 10) {
    textSize(58);
  } else if (dVal.length() < 11) {
    textSize(52);
  } else if (dVal.length() < 12) {
    textSize(47);
  } else if (dVal.length() < 13) {
    textSize(43);
  } else if (dVal.length() < 14) {
    textSize(40);
  } else {
    textSize(37);
  }
  text(dVal, width-5, 90);
  textFont(font2);
  if (dVal2.length() > 17) {
    text("..." + dVal2.substring(dVal2.length()-17), width-5, 30);
  } else {
    text(dVal2, width-5, 30);
  }
}

void keyPressed() {
  if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("×", false);
  } else if (keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 10 || keyCode == 61) {
    handleEvent("=", false);
  } else if (keyCode == 8 || keyCode == 67) {
    handleEvent("C", false);
  } else if (keyCode == 45) {
    handleEvent("±", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 14) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else if (dVal.equals("-0.0")) {
      dVal = ("-" +val);
    } else if (dVal.equals(str(result))) {
      handleEvent("C",false);
      dVal = (val);
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    update("done");
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    left = false;
    op = '+';
    update("op");
    dVal = "0.0";
  } else if (val.equals("-")) {
    left = false;
    op = '-';
    update("op");
    dVal = "0.0";
  } else if (val.equals("×")) {
    left = false;
    op = '×';
    update("op");
    dVal = "0.0";
  } else if (val.equals("÷")) {
    left = false;
    op = '÷';
    update("op");
    dVal = "0.0";
  } else if (val.equals("±")) {
    if (left) {
      l = l*-1;
      dVal = str(l);
    } else {
      r = r*-1;
      dVal = str(r);
    }
  } else if (val.equals("=")) {
    update("equals");
    performCalculation();
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      handleEvent("×", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      handleEvent("±", false);
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'A') {
      if (Ans != 0) {
        if (left) {
          l = Ans;
          dVal = str(l);
        } else {
          r = Ans;
          dVal = str(r);
        }
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    }
  }
  println("L:"+l+" Op:"+op+" R:"+r+" Result:"+result+" Left:"+left);
  println(lstr);
}

void performCalculation() {
  if (op == '+') {
    result = l+r;
  } else if (op == '-') {
    result = l-r;
  } else if (op =='×') {
    result = l*r;
  } else if (op =='÷') {
    result = l/r;
  } else {
    result = l;
  }
  dVal = str(result);
  lstr2 = lstr;
  lstr = dVal;
  rstr = str(r);
  l = result;
  left = true;
  Ans = result;
}

void update(String action) {
  if (op!=' ') {
    if (action.equals("op")) {
      lstr=dVal;
      dVal2 = lstr + " " + op;
    } else if (action.equals("equals")) {
      if (rstr=="" || float(rstr)!=r) {
        rstr=dVal;
      }
      dVal2 = lstr + " " + op + " " + rstr + " =";
    } else if (action.equals("done")) {
      if (rstr=="" || float(rstr)!=r) {
        rstr=dVal;
      }
      dVal2 = lstr2 + " " + op + " " + rstr + " =" + result;
    }
  }
}
