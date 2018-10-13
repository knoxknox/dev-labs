import java.util.stream.Stream;
import java.util.stream.Collectors;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * Java 8 - Async Computation
 * https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/CompletableFuture.html
 *
 * Methods with Async postfix    - running a corresponding step of execution in another thread
 * Methods without Async postfix - running the next execution stage using a current calling thread
 */
class DevLab {

  /**
   * Get result:
   *
   * future.get()
   * future.thenAccept(x -> System.out.println(x))
   * Stream.of(future1, future2).map(CompletableFuture::join).collect(Collectors.joining(""))
   */
  public static void main(String[] args)
    throws ExecutionException, InterruptedException {

    // #1
    CompletableFuture<String> future =
      CompletableFuture.supplyAsync(() -> "Hello");

    // #2
    CompletableFuture<String> future =
      CompletableFuture.supplyAsync(() -> "Hello").
      thenCompose(x -> CompletableFuture.supplyAsync(() -> x + " world"));

    // #3
    CompletableFuture<String> future1 =
      CompletableFuture.supplyAsync(() -> "Hello");
    CompletableFuture<String> future2 = future1.thenApply(x -> x + " world!");

    // #4
    CompletableFuture<String> future1 =
      CompletableFuture.supplyAsync(() -> "String 1");
    CompletableFuture<String> future2 =
      CompletableFuture.supplyAsync(() -> "String 2");
    CompletableFuture<String> future3 =
      CompletableFuture.supplyAsync(() -> "String 3");
    CompletableFuture<Void> parallel =
      CompletableFuture.allOf(future1, future2, future3);

    // #5
    CompletableFuture future =
      CompletableFuture.
        completedFuture(0).
        thenApplyAsync(x -> 1024 / x).
        thenApplyAsync(Integer::toBinaryString).
        exceptionally(ex -> "Error: " + ex.getMessage());

    CompletableFuture future =
      CompletableFuture.
        completedFuture(1).
        thenApplyAsync(x -> 1024 / x).
        thenApplyAsync(Integer::toBinaryString).
        handle((result, ex) -> result != null ? result : "Error: " + ex.getMessage());
  }

}
