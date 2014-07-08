class Repeller {
  PVector location;
  int strength = 100;

  Repeller(PVector l) {
    location = l.get();
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, 20, 20);
  }

  PVector repellingForce(Particle p) {
    PVector direction = PVector.sub(location, p.location);

    float d = constrain(direction.mag(), 5, 100);

    direction.normalize();

    float force = -1 * strength / (d * d);
    direction.mult(force);
    return direction;
  }
}
