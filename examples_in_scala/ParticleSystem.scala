import processing.core._

class ParticleSystem(sketch: PApplet, loc: PVector) {
  var origin = loc.get;
  val particles = scala.collection.mutable.ListBuffer.empty[Particle]

  def run() = {
    particles += new Particle(sketch, origin)
    val it = particles.iterator

    while(it.hasNext) {
      var p = it.next
      p.run
      removeIfDead(p)
    }
  }

  def removeIfDead(p: Particle) = {
    val index = particles.indexOf(p)
    if (p.isDead) { particles.remove(index) }
  }

  def updateOrigin(loc: PVector) {
    origin = loc;
  }
}

class Particle(sketch: PApplet, loc: PVector) {
  var l: PVector = loc.get
  var lifespan = 200
  var strokeColor = sketch.color(250, 100, 140)

  val particleSize = 10
  val velocity = new PVector(sketch.random(-1, 1), sketch.random(-2, 0))
  val acceleration = new PVector(0, 0.05.toFloat);

  def run() = {
    update
    display
  }

  def update() {
    velocity.add(acceleration)
    l.add(velocity)
    lifespan -= 1
  }

  def display() = {
    sketch.fill(244, lifespan)
    sketch.ellipse(l.x, l.y, particleSize, particleSize)
  }

  def isDead() = lifespan < 0
}
