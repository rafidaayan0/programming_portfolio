class Ship {
  int x, y, ammo, turretCount, health;


  // Constructor
  Ship() {
    x = 0;
    y = 0;
    ammo = 100;
    turretCount = 1;
    health = 1000;
  }

  void display() {
    rectMode(CENTER);
    fill(65);
    rect(x-21, y+40, 9, 3, 0, 0, 1, 1);
    rect(x+21, y+40, 9, 3, 0, 0, 1, 1);
    fill(210);
    rect(x-21, y+25, 12, 28, 3, 3, 2, 2);
    rect(x+21, y+25, 12, 28, 3, 3, 2, 2);
    stroke(90);
    fill(242, 135, 65);
    rect(x+21, y+30, 12, 5);
    rect(x-21, y+30, 12, 5);
    stroke(0);
    fill(210);
    beginShape();
    vertex(x-10, y+45);
    vertex(x+10, y+45);
    vertex(x+19, y+28);
    vertex(x+19, y+5);
    vertex(x+12, y-12);
    vertex(x+7, y-40);
    vertex(x+4, y-45);
    vertex(x-4, y-45);
    vertex(x-7, y-40);
    vertex(x-12, y-12);
    vertex(x-19, y+5);
    vertex(x-19, y+28);
    endShape(CLOSE);
    stroke(90);
    fill(242, 135, 65);
    rect(x, y+32, 34, 4, 15, 15, 45, 45);
    rect(x, y-32, 16, 3, 45, 45, 15, 15);
    stroke(0);
    fill(255, 70);
    beginShape();
    vertex(x-7, y+40);
    vertex(x+7, y+40);
    vertex(x+15, y+28);
    vertex(x+15, y+5);
    vertex(x+9, y-12);
    vertex(x+5, y-40);
    vertex(x+2, y-43);
    vertex(x-2, y-43);
    vertex(x-5, y-40);
    vertex(x-9, y-12);
    vertex(x-15, y+5);
    vertex(x-15, y+28);
    endShape(CLOSE);
    fill(90);
    beginShape();
    vertex(x+4, y-37);
    vertex(x+2, y-40);
    vertex(x-2, y-40);
    vertex(x-4, y-37);
    endShape();
    
    ////Hitbox testing
    //fill(255,0,0,128);
    //circle(x+5, y-40,10);
    //circle(x-5, y-40,10);
    //circle(x+20, y+20,15);
    //circle(x-20, y+20,15);
    //circle(x+10, y+45,10);
    //circle(x-10, y+45,10);
    //circle(x, y+20,25);
    //circle(x, y-5,25);
    //fill(128,128);
    //circle(x, y,280);
    
    ////Thruster Animation
    noStroke();
    //fill(255, 128, 20, 170);
    //triangle(x-16, y+41, x-26, y+41, x-21,y+lerp(47,55,(sin(millis()/200)+1)/2));
    //triangle(x+16, y+41, x+26, y+41, x+21,y+lerp(47,55,(sin(millis()/200)+1)/2));
    //fill(255, 196, 0, 170);
    //triangle(x-18, y+42, x-24, y+42, x-21,y+lerp(44,50,(sin(millis()/200)+1)/2));
    //triangle(x+18, y+42, x+24, y+42, x+21,y+lerp(44,50,(sin(millis()/200)+1)/2));
    //strokeWeight(1);
    fill(255, 0, 0, 50);
    triangle(x-14, y+41, x-28, y+41, x-21,y+lerp(50,60,(sin(millis()/200)+1)/2));
    triangle(x+14, y+41, x+28, y+41, x+21,y+lerp(50,60,(sin(millis()/200)+1)/2));
    fill(255, 128, 20, 250);
    triangle(x-16, y+41, x-26, y+41, x-21,y+lerp(47,55,(sin(millis()/200)+1)/2));
    triangle(x+16, y+41, x+26, y+41, x+21,y+lerp(47,55,(sin(millis()/200)+1)/2));
    fill(252, 177, 45, 250);
    triangle(x-18, y+42, x-24, y+42, x-21,y+lerp(44,50,(sin(millis()/200)+1)/2));
    triangle(x+18, y+42, x+24, y+42, x+21,y+lerp(44,50,(sin(millis()/200)+1)/2));
    fill(255, 250);
    triangle(x-19, y+42, x-23, y+42, x-21,y+lerp(44,48,(sin(millis()/200)+1)/2));
    triangle(x+19, y+42, x+23, y+42, x+21,y+lerp(44,48,(sin(millis()/200)+1)/2));
    strokeWeight(1);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (ammo >= turretCount) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    boolean d=false;
    if (dist(x, y, rock.x, rock.y) < 280) {
    boolean d11 = (dist(x+5, y-40, rock.x, rock.y) < (rock.hp/2));
    boolean d12 = (dist(x-5, y-40, rock.x, rock.y) < (rock.hp/2));
    boolean d21 = (dist(x+20, y+20, rock.x, rock.y) < (rock.hp/2)*0.8+5);
    boolean d22 = (dist(x-20, y+20, rock.x, rock.y) < (rock.hp/2)*0.8+5);
    boolean d31 = (dist(x+10, y+45, rock.x, rock.y) < (rock.hp/2));
    boolean d32 = (dist(x-10, y+45, rock.x, rock.y) < (rock.hp/2));
    boolean d4 = (dist(x, y+20, rock.x, rock.y) < (rock.hp/2)*0.8+15);
    boolean d5 = (dist(x, y-5, rock.x, rock.y) < (rock.hp/2)*0.8+15);
    d = (d11||d12||d21||d22||d31||d32||d4||d5);
    }
    return d;
  }
}
