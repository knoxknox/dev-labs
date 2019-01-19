package cloud9

import java.util.Random

object Version {
  def get(): String = {
    val random = new Random()
    s"1.0b${random.nextInt(50)}"
  }
}
