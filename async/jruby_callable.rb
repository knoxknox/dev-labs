java_import java.util.concurrent.Callable
java_import java.util.concurrent.Executors

class Worker
  include Callable

  def initialize(value)
    @value = value
  end

  def call
    File.write('/tmp/out.txt', @value, mode: 'a')
  end
end

executor = Executors.newFixedThreadPool(8)
100_000.times { |x| executor.submit(Worker.new(x)) }

executor.shutdown
