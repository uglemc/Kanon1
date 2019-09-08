PImage Kanon;
Boolean Skudt = false;
int antalkugler = 0;
PVector Lokation;
PVector Hastighed;
PVector Acceleration;
float Masse; 
int Pointcounter = 0;
Kanonkugle [] Kanonkugler = new Kanonkugle [50];


void Kanonskud() {
  fill(12);
  Kanonkugler[antalkugler] = new Kanonkugle (1, 400, 400);
  Skudt = true;
  antalkugler++;
}


Kanonkugle Jernkugle = new Kanonkugle (1, 400, 400);


void setup () {
  size(500, 500);
  frameRate(120);
  Kanon = loadImage ("epickanon.png");
}

void mouseClicked() {
  if (antalkugler < 51) {
    Kanonskud();
  }
}

void draw () {
  background(255);
  if (Skudt) {
    for (int i = 0; i < antalkugler; i++) {
      text("x-Hastigheden" + Kanonkugler[i].Hastighed.x, 50, 50);
      text("y-Hastigheden"+ Kanonkugler[i].Hastighed.y, 50, 80);
      image(Kanon, 400, 400, 120, 120);
      float x;
      x=Kanonkugler[i].Lokation.x/250;
      fill(0);
      text("Skydemålet", 5, 350);
      fill(255);
      ellipse(20, 380, 20, 20);
      fill(255, 0, 0);
      ellipse(20, 380, 10, 10);
      if (keyPressed) {
        if (key == 'n') {
          Kanonkugler[i].Hastighed.set(-2.5, -1.2);
        }
        if (key == 'm') {
          Kanonkugler[i].Hastighed.set(-5, -2, 4);
        }
        if (key == 'b') {
          Kanonkugler[i].Hastighed.set(-1.25, -0.6);
        }
      }
      PVector Tyngdekraft2 = new PVector (0, 0.0982);
      PVector Vindmodstand2 = new PVector (0.02, 0);
      Kanonkugler[i].applyForce(Vindmodstand2);
      Kanonkugler[i].applyForce(Tyngdekraft2);
      Kanonkugler[i].update();
      pushMatrix();
      translate(Kanonkugler[i].Lokation.x, Kanonkugler[i].Lokation.y);
      rotate(PI/x);
      Kanonkugler[i].displayK();
      popMatrix();
      Kanonkugler[i].checkEdges();
      Kanonkugler[i].PointCounter();
    }
  }
}
