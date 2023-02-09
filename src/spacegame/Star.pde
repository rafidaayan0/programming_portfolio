class Star {
  int x, y, diam, speed;
  color c1;
  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 4));
    speed = int(random(2, 5));
    int c = int(random(45));
    if (c > 3) {
      c1 = color(255);
    } else if (c == 0) {
      c1 = color(255, 255, 200);
    } else if (c == 1) {
      c1 = color(5, 171, 241);
    } else if (c == 2) {
      c1 = color(73, 33, 158);
    } else if (c == 3) {
      c1 = color(242, 116, 5);
      if (int(random(5))==1) {
        colorMode(HSB, 360);
        c1=color(random(360), 360, 360);
        colorMode(RGB, 255);
        speed=7;
        diam=10;
      }
    }
  }

  void display() {
    noStroke();
    if (diam==10) {
      colorMode(HSB, 360, 50, 100);
      for (int i=0; i<50; i++) {
        fill(hue(c1), 50-i, 100, 17);
        circle(x, (y+i*1.7)-25, i/5);
        fill(hue(c1), 50-i, 100, 140);
        circle(x, (y+i*1.7)-30, i/9.5);
      }
      colorMode(RGB, 255);
    } else {
      fill(c1, 3);
      circle(x, y, diam+20);
      fill(c1);
      circle(x, y, diam);
    }
  }

  void move() {
    if (y>height+5) {
      x = int(random(width));
      diam = int(random(1, 4));
      speed = int(random(2, 5));
      int c = int(random(45));
      if (c > 3) {
        c1 = color(255);
      } else if (c == 0) {
        c1 = color(255, 255, 200);
      } else if (c == 1) {
        c1 = color(5, 171, 241);
      } else if (c == 2) {
        c1 = color(73, 33, 158);
      } else if (c == 3) {
        c1 = color(242, 116, 5);
        if (int(random(5))==1) {
          colorMode(HSB, 360);
          c1 = color(random(360), 360, 360);
          colorMode(RGB, 255);
          speed=11;
          diam=10;
        }
      }
      y = -10;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
