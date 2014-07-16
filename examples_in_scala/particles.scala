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

  var particle = new Particle(new PVector(250, 100))

  override def setup() = {
    size(500, 500)
    background(3)
    smooth()
  }

  override def draw() = {
    background(3)
    particle.run()

    if (particle.isDead()) {
      particle = new Particle(new PVector(250, 100))
    }
  }

  class Particle(loc: PVector) {
    var l: PVector = loc
    var lifespan = 200
    var strokeColor = color(250, 100, 140)

    val particleSize = 10

    def run() = {
      update()
      display()
    }

    def update() {
      lifespan -= 1
    }

    def display() = {
      fill(244, lifespan)
      ellipse(l.x, l.y, particleSize, particleSize)
    }

    def isDead() = {
      lifespan < 0
    }
  }
}

BasicParticles.main()

//other classes

