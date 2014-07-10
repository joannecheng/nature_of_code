class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass = 1;
  PImage image;
  float lifespan = 255.0;
  Random gen;

  Particle(PVector l, PImage img) {
    location = l.get();
    image = img;
    gen = new Random();

    float vx = (float) gen.nextGaussian() * 0.3;
    float vy = (float) gen.nextGaussian() * 0.3 - 1.0;
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0.05);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }

  boolean isDead() {
    return lifespan < 0.0;
  }

  void render() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(image, location.x, location.y);
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
}
