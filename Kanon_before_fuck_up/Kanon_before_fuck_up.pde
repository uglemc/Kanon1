

class Kanonkugle {
  PVector Lokation;
  PVector Hastighed;
  PVector Acceleration;
  float Masse;

  Kanonkugle () {
    Masse = 15;
    Lokation = new PVector (50, 400);
    Hastighed = new PVector (5, 8);
    Acceleration = new PVector (0, 0);
  }
  Kanonkugle (float m, float x, float y) {
    Masse = m;
    x = 400;
    y = 400;

    Lokation = new PVector (x, y);
    Hastighed = new PVector (-5, -2.4);
    Acceleration = new PVector (0, 0);
  }
  void applyForce (PVector force) {
    PVector f = PVector.div(force, Masse);
    Acceleration.add(f);
  }
  void update() {
    Hastighed.add(Acceleration);
    Lokation.add(Hastighed);
    Acceleration.mult(0);
  }
  void display() {
    stroke (0);
    fill(70, 100, 30);
    ellipse (0, 0, Masse*12, Masse*12);
    rect (0, 0, Masse*12, Masse*12);
  }

  void checkEdges() {
    if (Lokation.x > width) {
      Lokation.x = width;
      Hastighed.x *= 0;
    } else if (Lokation.x < 0) {
      Hastighed.x *= 0;
      Lokation.x = 0;
    }

    if (Lokation.y > height) {
      Hastighed.y *=0;
      Lokation.y = height;
    }
  }
}

Kanonkugle Jernkugle = new Kanonkugle (1, 400, 400);

void setup () {
  size(500, 500);
  frameRate(12);
}

void draw () {
  float x;
  x=Jernkugle.Lokation.x/250;
  println(x);
  background(155);
  PVector Tyngdekraft = new PVector (0, 0.0982);
  PVector Vindmodstand = new PVector (0.02, 0);
  Jernkugle.applyForce(Tyngdekraft);
  Jernkugle.applyForce(Vindmodstand);
  Jernkugle.update();
  pushMatrix();
  translate(Jernkugle.Lokation.x, Jernkugle.Lokation.y);
  rotate(PI/x);
  Jernkugle.display();
  popMatrix();
  Jernkugle.checkEdges();
  text("Hastighed", 5, 50);
  text(Jernkugle.Hastighed.x, 65, 50);
  text(Jernkugle.Hastighed.y, 120, 50);
  text("Lokation", 5, 65);
  text(Jernkugle.Lokation.x, 65.0, 65.0);
  text(Jernkugle.Lokation.y, 120.0, 65.0);
  if (Jernkugle.Lokation.y == height) {
    Vindmodstand.x=0;
  }
}
