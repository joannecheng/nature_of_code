import java.util.*;

int total = 10;

ArrayList<Particle> plist = new ArrayList<Particle>();

void setup() {
  size(600, 600);
  for (int i = 0; i < total; i++) {
    PVector location = new PVector(width/2, height/2);
    plist.add(new Particle(location));
  }
}

void draw() {
  background(0);

  PVector location = new PVector(width/2, height/2);
  plist.add(new Particle(location));
  Iterator<Particle> it = plist.iterator();

  while(it.hasNext()){
    Particle p = it.next();
    p.run();

    if (p.isDead()) {
      it.remove();
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255.0;

  Particle(PVector l) {
    location = l;
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
