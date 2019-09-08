class Kanonkugle {
  PVector Lokation;
  PVector Hastighed;
  PVector Acceleration;
  float Masse; 
  PVector LokationE;
  PVector HastighedE;
  PVector AccelerationE;

  Kanonkugle () {
    Masse = 1;
    HastighedE = new PVector (random(0.5, 1.0), random(0.5, 1.0));
    AccelerationE = new PVector (random(-0.1, 0.1), -0.1);
    Lokation = new PVector (400, 400);
    Hastighed = new PVector (0.5, 0.8);
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

  void displayK() {
    stroke (0);
    fill(380-Lokation.x, 380-Lokation.y, 30);
    ellipse (0, 0, Masse*12, Masse*12);
    rect (0, 0, Masse*12, Masse*12);
  }

  void checkEdges() {
    if (Lokation.x > width) {
      Lokation.x = width;
      Hastighed.mult(0);
      Acceleration.mult(0);
      stroke(0);
      fill(0);
      rect (Lokation.x, Lokation.y, 4, 4);
    } else if (Lokation.x < 0) {
      Hastighed.x *= -1;
      Lokation.x = 0;
    }

    if (Lokation.y > height) {
      Hastighed.mult(0);
      Acceleration.mult(0);
      Lokation.y = height;
      stroke(0);
      fill(0);
      rect (Lokation.x, Lokation.y, 4, 4);
    }
  }
  void PointCounter() {
    text ("Antal point" + Pointcounter, 370, 20);
    if (20 > sqrt(sq(20-Lokation.x)+sq(380-Lokation.y))) {
      Pointcounter = Pointcounter +1;
    }
  }
}
