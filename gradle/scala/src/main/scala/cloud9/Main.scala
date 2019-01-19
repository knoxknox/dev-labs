package cloud9

object Main {
  def main(args: Array[String]) = {
    val version = Version.get
    println(s"app version: $version")
  }
}
