import java.util.*;
PImage img;
Particle p;

void setup() {
  img = loadImage("ralph.png");
  size(400, 400);
  p = new Particle(new PVector(width/2, height/2), img);
}


void draw() {
  background(0);
  p.render();
}
