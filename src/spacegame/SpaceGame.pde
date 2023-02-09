// Rafid Aayan | 29 Nov 2022 | Spaceship
import processing.sound.*;
//SoundFile[] laser;

Ship carl;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer rockTimer, puTimer, turTimer;
Timer laserCoolDown;
Star[] stars = new Star[70];
int score, level;
boolean play, timeB;
int rockTime = 500;
int puTime = 9000;
int turTime = 20000;
int laserTime = 350;
int screenColor = 0;
int timeI = 0;

void setup() {
  size(800, 800);
  carl = new Ship();
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  puTimer = new Timer(puTime);
  puTimer.start();
  turTimer = new Timer(turTime);
  laserCoolDown = new Timer(laserTime);
  laserCoolDown.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
  timeB = true;
}

void draw() {
  if (screenColor > 360) {
    screenColor = 0;
  } else {
    screenColor++;
  }
  if (!play) {
    startScreen();
  } else if (carl.health<=0) {
    gameOver();
    if (timeB) {
      timeI = millis();
      timeB = false;
    }
  } else
  {
    background(0);
    noCursor();

    // Render Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    // Adding PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    // Render PowerUps (w/ collision detection)
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      if (p.intersect(carl)) {
        if (p.type == 'H') {
          carl.health+=100;
        }
        if (p.type == 'A') {
          carl.ammo+=50;
        }
        if (p.type == 'T') {
          if (carl.turretCount<5) {
            carl.turretCount++;
            laserCoolDown.totalTime = int(laserCoolDown.totalTime*1.3);
            turTimer.start();
            println(laserCoolDown.totalTime);
          }
        }
        powerups.remove(p);
      }
      if (p.reachedBottom()) {
        powerups.remove(p);
      } else {
        p.display();
        p.move();
      }
    }

    if (turTimer.isFinished()) {
      if (carl.turretCount > 1) {
        carl.turretCount--;
        laserCoolDown.totalTime = int(laserCoolDown.totalTime/1.3);
        turTimer.start();
        println(laserCoolDown.totalTime);
      }
    }

    // Adding Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      if (level >= 6) {
        Rock r = rocks.get(rocks.size()-1);
        r.hp = int(r.hp*2.25);
      }
      rockTimer.start();
    }

    // Render Rocks (w/ collision detection)
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (carl.intersect(r)) {
        carl.health-=r.diam;
        score+=r.diam;
        explosions.add(new Explosion(r.x, r.y-10, r.speed));
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
        //println(rocks.size());
      }
    }

    // Rendering Lasers (w/ collision detection)
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          r.hp-=l.dmg;
          if (r.hp < 60) {
            explosions.add(new Explosion(r.x, r.y, r.speed));
            rocks.remove(r);
            score+=r.diam;
          }
          lasers.remove(l);
        }
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
        //println("l" + lasers.size());
      }
    }

    for (int i=0; i<explosions.size(); i++) {
      Explosion e = explosions.get(i);
      e.display();
      e.move();
      if (millis()>e.startT+75) {
        explosions.remove(e);
      }
    }

    //Next level
    if (score>level*1000) {
      level++;
      carl.ammo+=20;
      if (level < 6) {
        rockTimer.totalTime = int(rockTimer.totalTime*0.78);
      } else if (level == 6) {
        rockTimer.totalTime = rockTime;
      } else if (level > 6) {
        //rockTimer.totalTime = int(rockTime*1.5);
        rockTimer.totalTime = int(rockTimer.totalTime*0.815);
      }
    }

    carl.display();
    carl.move(mouseX, mouseY);
    infoPanel();
  }
}

void mousePressed() {
  // Adding Lasers
  if (laserCoolDown.isFinished()) {
    if (carl.fire() && carl.turretCount == 1) {
      lasers.add(new Laser(carl.x, carl.y));
      carl.ammo -= carl.turretCount;
      laserCoolDown.start();
    } else if (carl.fire() && carl.turretCount == 2) {
      lasers.add(new Laser(carl.x+15, carl.y));
      lasers.add(new Laser(carl.x-15, carl.y));
      carl.ammo -= carl.turretCount;
      laserCoolDown.start();
    } else if (carl.fire() && carl.turretCount == 3) {
      lasers.add(new Laser(carl.x, carl.y-7));
      lasers.add(new Laser(carl.x+15, carl.y));
      lasers.add(new Laser(carl.x-15, carl.y));
      carl.ammo -= carl.turretCount;
      laserCoolDown.start();
    } else if (carl.fire() && carl.turretCount == 4) {
      lasers.add(new Laser(carl.x, carl.y-15));
      lasers.add(new Laser(carl.x, carl.y+10));
      lasers.add(new Laser(carl.x+15, carl.y));
      lasers.add(new Laser(carl.x-15, carl.y));
      carl.ammo -= carl.turretCount;
      laserCoolDown.start();
    } else if (carl.fire() && carl.turretCount == 5) {
      lasers.add(new Laser(carl.x, carl.y-15));
      lasers.add(new Laser(carl.x+14, carl.y-5));
      lasers.add(new Laser(carl.x-14, carl.y-5));
      lasers.add(new Laser(carl.x+21, carl.y+5));
      lasers.add(new Laser(carl.x-21, carl.y+5));
      carl.ammo -= carl.turretCount;
      laserCoolDown.start();
    }
  }
}

void keyPressed() {
}

void infoPanel() {
  rectMode(CENTER);
  fill(128, 128);
  rect(width/2, 25, width, 50);
  fill(255, 128);
  textSize(35);
  textAlign(CENTER);
  text("Score:" + score +
    " | Level:" + level +
    " | HP: " + carl.health +
    " | Ammo: " + carl.ammo
    , width/2, 40);
  if (carl.ammo != 0) {
    arc(height-60, width-60, 75, 75, radians(270), radians(map(millis() - laserCoolDown.savedTime, 0, laserTime, 0, 360)+270), PIE);
  }
}

void startScreen() {
  background(0);
  fill(255);
  textSize(35);
  textAlign(CENTER);
  for (int i=0; i<150; i++) {
    colorMode(HSB, 360, 100, 150);
    noFill();
    stroke(screenColor, 100, i);
    rectMode(CENTER);
    rect(width/2, height/2-10, i+350, i);
  }
  colorMode(RGB, 255);
  text("Press any key to begin...", width/2, height/2);
  if (keyPressed || mousePressed) {
    play=true;
  }
}

void gameOver() {
  background(0);
  textSize(35);
  textAlign(CENTER);
  for (int i=0; i<150; i++) {
    colorMode(HSB, 360, 100, 150);
    noFill();
    stroke(screenColor, 100, i);
    rectMode(CENTER);
    rect(width/2, height/2-10, i+200, i+150);
  }
  fill(0, 0, 150);
  text("Game Over", width/2, height/2-60);
  fill(screenColor, 100, 150);
  text("Level: " + level, width/2, height/2-20);
  text("Score: " + score, width/2, height/2+20);
  String timeS = "";
  timeS = str(timeI/1000) + " seconds";
  text(timeS, width/2, height/2+60);
}
