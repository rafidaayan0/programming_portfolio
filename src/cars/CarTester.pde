// Rafid Aayan | 25 Oct 2022 | Cars Exercise

Car[] cars = new Car[20];

void setup() {
  size(500, 500);
  for (int i = 0; i<cars.length; i++) {
    cars[i] = new Car();
  }
  for (int i = 0; i<cars.length; i++) {
    boolean touch = true;
    while (touch) {
      touch = false;
      for (int j = 0; j<cars.length; j++) {
        if (i!= j && cars[i].ypos <= cars[j].ypos + 16 && cars[i].ypos >= cars[j].ypos - 16) {
          touch = true;
          cars[i].ypos = random(10, height-10);
        }
      }
    }
  }
}

void draw() {
  background(128);
  for (int i = 0; i<cars.length; i++) {
    fill(40+(60*i/cars.length));
    rectMode(CENTER);
    rect(width/2, cars[i].ypos, width, 16);
    cars[i].display();
    cars[i].drive();
  }
  for (int i = 0; i<cars.length; i++) {
    float space = cars[i].size/2;
    int dir2;
    float bri;
    noStroke();
    if (cars[i].dir) {
      dir2 = 1;
      bri = (space/16*cars[i].xpos/width*117);
      if (int(space)%2==0) {
        fill(255, 220, 128, bri);
      } else {
        fill(255, bri);
      }
    } else {
      dir2 = -1;
      bri = (space/16*(117-cars[i].xpos/width*117));
      if (int(space)%2==0) {
        fill(255, 220, 128, bri);
      } else {
        fill(255, bri);
      }
    }
    bri/=50;
    triangle(cars[i].xpos+(space*dir2), cars[i].ypos+4, cars[i].xpos+((space+25+(space*bri))*dir2), cars[i].ypos-10*(bri), cars[i].xpos+((space+25+(space*bri))*dir2), cars[i].ypos+20*(bri));
    triangle(cars[i].xpos+(space*dir2), cars[i].ypos-4, cars[i].xpos+((space+25+(space*bri))*dir2), cars[i].ypos+10*(bri), cars[i].xpos+((space+25+(space*bri))*dir2), cars[i].ypos-20*(bri));
    stroke(0);
  }
}
