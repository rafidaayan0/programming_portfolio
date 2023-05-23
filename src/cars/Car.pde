class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean dir;
  int size;

  // Constructor
  Car() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(10, height-10);
    xspeed = random(1, 5);
    size = int(random(17, 25));
    if (random(2) > 1) {
      dir = true;
    } else {
      dir = false;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(0);
    int w = (size*3/10);
    rect(xpos-w, ypos+5, 5, 2);
    rect(xpos+w, ypos+5, 5, 2);
    rect(xpos-w, ypos-5, 5, 2);
    rect(xpos+w, ypos-5, 5, 2);
    fill(c);
    rect(xpos, ypos, size, 10);
  }

  void drive() {
    if (dir) {
      xpos += xspeed;
      if (xpos > width) {
        xpos = 0;
      }
    } else {
      xpos -= xspeed;
      if (xpos < 0) {
        xpos = width;
      }
    }
  }
}
