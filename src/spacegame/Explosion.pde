class Explosion {
  int x, y, speed, startT;

  // Constructor
  Explosion(int x, int y, int speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    startT = millis();
  }

  void display() {
    fill(255);
    circle(x,y,map(millis(),startT,startT+50,0,5)*5);
  }

  void move() {
    y += speed;
  }

}
