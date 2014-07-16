import processing.core._

object BasicParticles extends PApplet {
  private var mySketch:BasicParticles = _

  def main() = {
    mySketch = new BasicParticles

    val frame = new javax.swing.JFrame("BasicParticles")
    frame.getContentPane().add(mySketch)
    mySketch.init

    frame.setSize(500, 500)
    frame.setVisible(true)
  }
}

class BasicParticles extends PApplet {
  // Processing sketch code goes here!

  val particleSystem = new ParticleSystem(new PVector(250, 100))

  override def setup() = {
    size(500, 500)
    background(3)
    smooth()

  }

  override def draw() = {
    background(3)
    particleSystem.run()
  }

  override def mousePressed() = {
    particleSystem.updateOrigin(new PVector(mouseX, mouseY))
  }

  class ParticleSystem(loc: PVector) {
    var origin = loc.get;
    val particles = scala.collection.mutable.ListBuffer.empty[Particle]

    def run() = {
      particles += new Particle(origin)

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

  class Particle(loc: PVector) {
    var l: PVector = loc.get
    var lifespan = 200
    var strokeColor = color(250, 100, 140)

    val particleSize = 10
    val velocity = new PVector(random(-1, 1), random(-2, 0))
    val acceleration = new PVector(0, 0.05.toFloat);

    def run() = {
      update()
      display()
    }

    def update() {
      velocity.add(acceleration)
      l.add(velocity)
      lifespan -= 1
    }

    def display() = {
      fill(244, lifespan)
      ellipse(l.x, l.y, particleSize, particleSize)
    }

    def isDead() = lifespan < 0
  }

}

BasicParticles.main()

//other classes
