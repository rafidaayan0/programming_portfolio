class PowerUp {
  int x, y, diam, speed;
  char type;
  PImage powerup;

  // Constructor
  PowerUp() {
    x = int(random(40,width-40));
    y = -100;
    diam = 100;
    speed = 3;
    int rand = int(random(3));
    powerup = loadImage("powerup.png");
    if (rand==0) {
      type = 'H';
    } else if (rand==1) {
      type = 'A';
    } else if (rand==2) {
      type = 'T';
    }
  }

  void display() {
    if (type=='H') {
      fill(255,0,0);
      rect(x,y,30,40);
    } else if (type=='A') {
      fill(255,255,0);
      rect(x,y,30,40);
    } else if (type=='T') {
      fill(255,128,0);
      rect(x,y,30,40);
    }
    imageMode(CENTER);
    powerup.resize(60,60);
    image(powerup,x,y);
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
  
    boolean intersect(Ship ship) {
    if (dist(x, y, ship.x, ship.y)<60) {
      return true;
    } else {
      return false;
    }
  }
}
