package cloud9

import org.junit.Assert._
import junit.framework.TestCase

class Specs extends TestCase {

  def testMath {
    assertEquals(2 + 2, 4)
  }

  def testVersion {
    val version = Version.get
    assertEquals(version.split("b")(0), "1.0")
  }

}
