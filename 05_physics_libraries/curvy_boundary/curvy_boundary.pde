import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing world;
BodyDef bd = new BodyDef();

void setup() {
  world = new Box2DProcessing(this);
  world.createWorld();

  Body b = world.createBody(bd);

  ChainShape cs = new ChainShape();

  Vec2[] vertices = new Vec2[2];
  vertices[0] = world.coordPixelsToWorld(0, 150);
  vertices[1] = world.coordPixelsToWorld(width, 150);

  cs.createChain(vertices, vertices.length);

  FixtureDef fd = new FixtureDef();
  fd.shape = cs;
  fd.density = 1;
  fd.friction = 0.3;
  fd.restitution = 0.5;

  body.createFixture(fd);
}

void draw() {
}

class Particle {
}

class Surface{
  ArrayList<Vec2> surface;

  Surface() {
  }
}
