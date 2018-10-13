/**
 * Docs:
 * val threadPool = Executors.newFixedThreadPool(10)
 * Future { ... }(ExecutionContext.fromExecutor(threadPool))
 * https://www.scala-lang.org/api/2.12.3/scala/concurrent/Future.html
 */
import scala.concurrent._
import scala.util.Success
import scala.util.Failure
import ExecutionContext.Implicits.global

def length(string: String): Future[List[String]] = {
  Future {
    Thread.sleep(500)
    List(string, string.length.toString)
  }
}

// for
val sum = for {
  x <- Future(3)
  y <- Future(5)
  z <- Future(y)
} yield x + y + z
sum.foreach(println)

// callbacks
length("str").onComplete {
  case Success(value) => println(value)
  case Failure(error) => println(error)
}

// combinators
length("str").map(x => x.map(_.toUpperCase)).foreach(println)
Future { throw new Exception("ex") }.fallbackTo(Future(0)).foreach(println)
Future(42 / 0).recover { case ex: ArithmeticException => -1 }.foreach(println)
Future(3).flatMap(x => Future(5).flatMap(y => Future(7).map(z => x + y + z))).foreach(println)
Future(10).andThen { case _ => throw new Exception("ex") }.andThen { case Failure(ex) => println(ex) }

Thread.sleep(1000)
println("completed")
