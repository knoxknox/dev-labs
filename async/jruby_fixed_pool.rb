require 'sinatra'
require 'concurrent'

class Task
  def self.pool
    @pool ||= begin
      puts 'create thread pool'
      Concurrent::FixedThreadPool.new(10)
    end
  end

  def self.execute(&block)
    Concurrent::Future.execute(executor: pool) { block.call }
  end
end

get '/' do
  Task.execute { sleep(8); File.write('/tmp/8.txt', '8'); puts '8' }
  Task.execute { sleep(4); File.write('/tmp/4.txt', '4'); puts '4' }
  Task.execute { sleep(2); File.write('/tmp/2.txt', '2'); puts '2' }
  Task.execute { sleep(1); File.write('/tmp/1.txt', '1'); puts '1' }
end

Signal.trap('SIGINT') { puts 'Waiting for completion'; Task.pool.shutdown }
