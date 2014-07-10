import java.util.*;

ParticleSystem ps;

void setup() {
  size(600, 600, P3D);
  PVector origin = new PVector(width/2, height/2);

  ps = new ParticleSystem(origin);
}

void draw() {
  PVector l = new PVector(mouseX, mouseY);
  ps.setOrigin(l);

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

  void setOrigin(PVector o) {
    origin = o.get();
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
  float zPos;

  Particle(PVector l) {
    location = l.get();
    zPos = random(-10, 10);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0.05);
    rotateY(radians(90));
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
    noStroke();
    lights();
    pushMatrix();
    translate(location.x,location.y, zPos);
    fill(255,lifespan);
    sphere(8);
    popMatrix();
  }

  boolean isDead() {
    return lifespan < 0.0;
  }
}
