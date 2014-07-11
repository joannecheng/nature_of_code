import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing world;
ArrayList<Box> boxes;

Boundary bound;

void setup() {
  size(400, 400);
  background(255);
  boxes = new ArrayList<Box>();
  world = new Box2DProcessing(this);
  world.createWorld();

  bound = new Boundary(50, height/2, 100, 10);
}

void draw() {
  background(255);
  world.step();

  if (mousePressed) {
    Box b = new Box(mouseX, mouseY);
    boxes.add(b);
  }

  for(Box b: boxes) {
    b.display();
  }

  bound.display();
}

class Box {
  Body body;
  float w, h;
  float lifespan = 255.0;

  Box(float x_, float y_) {
    w = 16;
    h = 16;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(world.coordPixelsToWorld(x_, y_));

    body = world.createBody(bd);
    PolygonShape ps = new PolygonShape();

    float box2dW = world.scalarPixelsToWorld(w/2);
    float box2dH = world.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
  }

  boolean isDead() {
    return lifespan < 0;
  }

  void display() {
    Vec2 pos = world.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
    lifespan -= 2.0;
  }
}

class Boundary {
  float w, h, x, y;

  Body b;

  Boundary(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    BodyDef bd = new BodyDef();
    bd.position.set(world.coordPixelsToWorld(x, y));
    bd.type = BodyType.STATIC;
    b = world.createBody(bd);

    float worldW = world.scalarPixelsToWorld(w/2);
    float worldH = world.scalarPixelsToWorld(h/2);
    PolygonShape ps = new PolygonShape();

    ps.setAsBox(worldW, worldH);

    b.createFixture(ps, 1);
  }

  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
