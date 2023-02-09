class Button {
  // Member Variable
  int x, y, w, h;
  color c1;
  char val;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, color c1, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.val = val;
    on = false;
  }

  // Member Methods
  void display() {
    if (!on) {
      strokeWeight(0);
      fill(c1);
    } else {
      strokeWeight(0);
      fill(c1, 227);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(24);
    textAlign(CENTER);
    if (val=='s') {
      text("𝑥²", x, y+9);
    } else if (val=='A') {
      text("Ans", x, y+9);
    } else {
      text(val, x, y+9);
    }
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
