class Rock {
  int x, y, diam, hp, speed;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(40,width-40));
    y = -100;
    diam = int(random(60, 75));
    hp = diam;
    speed = int(random(3, 10));
    int i = int(random(3));
    if (i==0) {
      rock = loadImage("Rock1.png");
    } else if (i==1) {
      rock = loadImage("Rock2.png");
    } else if (i==2) {
      rock = loadImage("Rock3.png");
    }
  }

  void display() {
    imageMode(CENTER);
    rock.resize(hp,hp);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y - 40> height) {
      return true;
    } else {
      return false;
    }
  }
}
