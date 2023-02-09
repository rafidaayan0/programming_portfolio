//WIP
class Enemy {
  int x, y, hp, speed, tx, ty, sx, sy;
  //PImage rock;

  // Constructor
  Enemy() {
    sx = int(random(40,width-40));
    sy = -100;
    x = sx;
    y = sy;
    hp = 700;
    speed = int(random(3, 10));
    tx = width/2+int(random(-100,100));
    ty = 120;
    //int i = int(random(3));
    //if (i==0) {
    //  rock = loadImage("Rock1.png");
    //} else if (i==1) {
    //  rock = loadImage("Rock2.png");
    //} else if (i==2) {
    //  rock = loadImage("Rock3.png");
    //}
  }

  void display() {
    //imageMode(CENTER);
    //rock.resize(hp,hp);
    //image(rock, x, y);
    rect(x,y,50,50);
  }
  
  void startmove() {
    
  }

  void move() {
    x+=lerp(x,tx,0.25);
    y+=lerp(x,ty,0.25);
  }

  boolean reachedPostion() {
    if ((x<=tx+15&&x>=tx-15)&&(y<=ty+15&&y>=ty-15)) {
      return true;
    } else {
      return false;
    }
  }
}
