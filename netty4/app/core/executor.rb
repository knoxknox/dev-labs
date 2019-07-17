require 'singleton'

java_import 'java.util.concurrent.TimeUnit'
java_import 'java.util.concurrent.ArrayBlockingQueue'
java_import 'java.util.concurrent.ThreadPoolExecutor'
java_import 'com.google.common.util.concurrent.Futures'
java_import 'com.google.common.util.concurrent.MoreExecutors'
java_import 'com.google.common.util.concurrent.FutureCallback'

##
# Documentation:
# https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ArrayBlockingQueue.html
# https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadPoolExecutor.html
# https://guava.dev/releases/snapshot-jre/api/docs/com/google/common/util/concurrent/Futures.html
# https://guava.dev/releases/snapshot-jre/api/docs/com/google/common/util/concurrent/MoreExecutors.html
# https://guava.dev/releases/snapshot-jre/api/docs/com/google/common/util/concurrent/ListeningExecutorService.html
#
module Labs
  class Executor
    include Singleton

    ##
    # Initializes a worker thread-pool.
    # When number of tasks > queue length = a new thread.
    #
    def initialize
      @thread_pool = create_thread_pool(configatron)
      @executor_service = MoreExecutors::listening_decorator(@thread_pool)
      @callable_class = java.lang.Class.for_name('java.util.concurrent.Callable')
    end

    ##
    # Returns statistics about thread-pool.
    #
    def stats
      @thread_pool.to_s
    end

    ##
    # Submits a Callable object, which will be called.
    # On complete, the FutureCallback object is invoked.
    #
    def submit(callable, callback)
      listenable_future = submit_task(callable)
      Futures::add_callback(listenable_future, callback)
    end


    private

    ##
    # Submits a task for execution and returns a Future.
    #
    def submit_task(callable)
      @executor_service.java_method(:submit, [@callable_class]).call(callable)
    end

    ##
    # Creates a new thread-pool with args:
    # - number of threads to keep in the pool;
    # - maximum number of threads to allow in the pool;
    # - maximum time to wait before remove excess idle threads;
    # - the time unit for keep-alive-time arg (previous parameter);
    # - the working queue to use for holding tasks before they are executed;
    # - the handler to use when execution is blocked due to threads/queue limits;
    #
    def create_thread_pool(config)
      ThreadPoolExecutor.new(
        config.threadpool.size,
        config.threadpool.maxsize,
        config.threadpool.keepalive,
        TimeUnit::SECONDS,
        create_thread_pool_queue(config),
        ThreadPoolExecutor::CallerRunsPolicy.new)
    end

    ##
    # Creates a queue to use for holding tasks before they are executed.
    # This queue will hold only the Runnable tasks submitted by the execute method.
    #
    def create_thread_pool_queue(config)
      ArrayBlockingQueue.new(config.threadpool.max_queue_size)
    end

  end
end
