import java.util.*;
ParticleSystem ps;

PVector gravity = new PVector(0, 0.09);
Repeller r1;
Repeller r2;

void setup() {
  background(0);
  size(600, 600);
  fill(255);
  PVector l = new PVector(width/2, height/2);
  ps = new ParticleSystem(2, l);

  r1 = new Repeller(new PVector(width/2, height/2 + 50));
  r2 = new Repeller(new PVector(width/2 + 50, height/2 + 50));
}

void draw() {
  background(0);
  ps.applyForce(gravity);
  ps.applyRepeller(r1);
  ps.applyRepeller(r2);
  r1.display();
  r2.display();
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector loc;

  ParticleSystem(int num, PVector l) {
    particles = new ArrayList();
    loc = l;

    for (int i=0; i<num; i++) {
      addRandomConfetti(particles);
    }
  }

  void run() {
    addRandomConfetti(particles);
    Iterator<Particle> it = particles.iterator();

    while(it.hasNext()){
      Particle p = it.next();
      p.run();

      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void applyForce(PVector f) {
    for(Particle p: particles) {
      p.applyForce(f);
    }
  }

  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repellingForce(p);
      p.applyForce(force);
    }
  }

  void addRandomConfetti(ArrayList<Particle> particles) {
    float r = random(1);

    if (r < 0.33) { particles.add(new HappyConfetti(loc)); }
    else if (r < 0.67) { particles.add(new FunConfetti(loc)); }
    else { particles.add(new WackyConfetti(loc)); };
  }
}

class HappyConfetti extends Confetti {
  HappyConfetti(PVector l) {
    super(l);
  }

  void display() {
    fill(100, 230, 120);

    rotatingConfetti();
  }
}

class FunConfetti extends Confetti{
  FunConfetti(PVector l) {
    super(l);
  }

  void display() {
    fill(100, 120, 230);

    rotatingConfetti();
  }
}

class WackyConfetti extends Confetti{
  WackyConfetti(PVector l) {
    super(l);
  }

  void display() {
    fill(random(244), random(255), random(255));

    rotatingConfetti();
  }
}

class Confetti extends Particle {
  Confetti(PVector l) {
    super(l);
  }

  void rotatingConfetti() {
    float theta = map(location.x, 0, width, 0, TWO_PI*2);
    rectMode(CENTER);

    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, 8, 8);
    popMatrix();
  }
}
