class Laser {
  int x, y, w, h, speed, dmg;
  color c1;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 12;
    speed = 7;
    dmg = 70;
    c1 = color(255, 0, 0);
  }

  void display() {
    rectMode(CENTER);
    fill(c1, 70);
    rect(x, y, w+4, h+4);
    fill(c1);
    rect(x, y, w, h);
    fill(255);
    rect(x, y, w-3, h-1);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y < -15) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    if (dist(x, y, rock.x, rock.y)<(rock.hp/2)*0.8+5) {
      return true;
    } else {
      return false;
    }
  }
}
