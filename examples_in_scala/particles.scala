import processing.core._

object BasicParticles extends PApplet {
  private var mySketch:BasicParticles = _

  def main() = {
    mySketch = new BasicParticles

    val frame = new javax.swing.JFrame("BasicParticles")
    frame.getContentPane().add(mySketch)
    mySketch.init

    frame.setSize(600, 600)
    frame.setVisible(true)
  }
}

class BasicParticles extends PApplet {
  // Processing sketch code goes here!

  val particleSystem = new ParticleSystem(this, new PVector(250, 100))

  override def setup() = {
    size(600, 600)
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
}

BasicParticles.main()
