package cloud9

import org.scalatest.FunSpec

class Specs extends FunSpec {

  it("test math") {
    assert(2 + 2 == 4)
  }

  it("test version") {
    val version = Version.get
    assert(version.split("b")(0) == "1.0")
  }

}
