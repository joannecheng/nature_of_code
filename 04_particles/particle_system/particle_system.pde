import java.util.*;

int total = 10;

ParticleSystem ps;

void setup() {
  size(600, 600);
  PVector origin = new PVector(width/2, height/2);

  ps = new ParticleSystem(origin);
}

void draw() {
  background(0);
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
    origin = location.get();
  }

  void add() {
    particles.add(new Particle(origin));
  }

  void run() {
    particles.add(new Particle(origin));
    Iterator<Particle> it = particles.iterator();

    while(it.hasNext()){
      Particle p = it.next();
      p.run();

      if (p.isDead()) {
        it.remove();
      }
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255.0;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0.05);
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }

  boolean isDead() {
    return lifespan < 0.0;
  }
}
