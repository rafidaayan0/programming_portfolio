// Rafid Aayan | 6 Oct 2022 | Converter App

int position=0;
boolean mouse=true;
boolean instr=true;
int hue=0;

void setup() {
  size(1000, 200);
  textAlign(CENTER);
}

void keyPressed() {
  if (key=='q' && mouse) {
    mouse=false;
  } else if (key=='q' && !mouse) {
    mouse=true;
  }
  if (key=='e' && instr) {
    instr=false;
  } else if (key=='e' && !instr) {
    instr=true;
  }
  if (!mouse) {
    if (key=='a' || keyCode == LEFT) {
      position--;
    } else if (key=='d' || keyCode == RIGHT) {
      position++;
    }
  }
}

void draw() {
  background(117);

  if (mouse) {
    position=mouseX;
  }

  if (mouseY>90 && mouseY<110) {
    noCursor();
  } else {
    cursor();
  }

  fill(0);
  rect(0, 0, 20, 20);
  fill(255);
  textSize(17);
  text("?", 11, 15);

  text("By Rafid Aayan", width/2, 60);
  textSize(25);
  text("Length Converter", width/2, 40);

  line(0, 100, width, 100);
  for (int i=25; i<width; i+=25) {
    line(i, 97, i, 103);
  }
  for (int i=100; i<width; i+=100) {
    line(i, 95, i, 105);
    textSize(14);
    text(i, i, 90);
  }

  if (hue==1000) {
    hue=0;
  }
  else {
    hue++;
  }
  
  colorMode(HSB,1000);
  for (float i=0; i<position; i++) {
    stroke(color(hue, 1000, i/position*1000));
    line(i, 98, i, 102);
  }
  colorMode(RGB,255);

  circle(position, 100, 4);
  stroke(0);
  if (position<15) {
    text(position, 15, 115);
  } else if (position>985) {
    text(position, 985, 115);
  } else {
    text(position, position, 115);
  }
  text("Feet to Inches: " + feetToInch(position), width/2, 130);
  text("Feet to Yards: " + feetToYard(position), width/2, 146);
  text("Feet to Miles: " + feetToMile(position), width/2, 162);
  text("Feet to Meters: " + feetToMeter(position), width/2, 178);

  if ((mouseX<20 && mouseY<20) || instr) {
    text("This app converts feet to inches, yards, miles, and meters", 200, 40);
    text("using the value on the number line.", 200, 55);
    text("Use 'q' to switch between controlling with mouse or keyboard.",200,140);
    textSize(12);
    text("A mouse click might be needed to make it detect the keyboard.",200,155);
    text("Use 'e' to hide these instructions.",200,170);
  }
}

float feetToInch(float val) {
  val = val*12;
  return val;
}

float feetToYard(float val) {
  val = val/3.0;
  return val;
}

float feetToMile(float val) {
  val = val/5280.0;
  return val;
}

float feetToMeter(float val) {
  val = val/3.281;
  return val;
}
