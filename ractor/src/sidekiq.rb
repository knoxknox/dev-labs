class WorkerPool
  attr_reader :workers

  def initialize(count)
    @workers = create_pool(count)
  end

  def self.perform(opts)
    opts[:klass].new.perform(*opts[:args])
  end

  def perform_async(klass, *args)
    worker, _ = Ractor.select(*workers)
    worker.send({ klass: klass, args: args })
  end

  private

  def create_pool(count)
    count.times.map { spawn_worker_and_wait }
  end

  def spawn_worker_and_wait
    Ractor.new do
      Ractor.yield(:ready)
      loop { Ractor.yield WorkerPool.perform(Ractor.receive) }
    end
  end
end

class PrintMessageJob
  def perform(message)
    puts "[#{Time.now}] #{message}"
  end
end

pool = WorkerPool.new(8)
10.times { |i| pool.perform_async(PrintMessageJob, i) } && sleep(1)
