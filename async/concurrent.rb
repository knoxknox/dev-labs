require 'concurrent'

##
# Concurrent::Async
#
class AsyncTask
  include Concurrent::Async

  def execute(message)
    sleep(0.5)
    puts "#{Time.now.to_i}: #{message}"
  end
end

class AsyncClient
  def initialize(task)
    @task = task
  end

  def call
    @task.execute("call")
  end

  def call_async
    3.times do |i|
      @task.async.execute("call_async #{i}")
    end
  end

  def call_await
    3.times do |i|
      @task.await.execute("call_await #{i}")
    end
  end
end

# client::call
# 1539424656: call
# client::call_async
# client::call_await
# 1539424656: call_async 0
# 1539424657: call_async 1
# 1539424657: call_async 2
# 1539424658: call_await 0
# 1539424658: call_await 1
# 1539424659: call_await 2
task = AsyncTask.new
client = AsyncClient.new(task)
client.call       # synchronous, not thread-safe, returns the actual value
client.call_async # async, non-blocking, thread-safe, returns IVar[state=pending]
client.call_await # synchronous, blocking, thread-safe, returns IVar[state=fulfilled]

##
# Concurrent::Future
#
class FutureTask
  def execute(message)
    sleep(0.5) && message
  end
end

class FutureClient
  def initialize(task)
    @task = task
  end

  def execute(message)
    Concurrent::Future.execute { @task.execute(message) }
  end
end

task = FutureTask.new
client = FutureClient.new(task)
future = client.execute('message') # future.state == pending
sleep(1) && puts("#{future.state}, #{future.value}") # future.state == fulfilled

##
# Concurrent::Promise
#
class PromiseTask
  def execute(message)
    sleep(0.5) && message
  end
end

class PromiseClient
  def initialize(task)
    @task = task
  end

  def execute(message)
    Concurrent::Promise.execute { @task.execute(message) }
  end
end

task = PromiseTask.new
client = PromiseClient.new(task)
promise = client.execute('message') # promise.state == pending
sleep(1) && puts("#{promise.state}, #{promise.value}") # promise.state == fulfilled
Concurrent::Promise.new(10).then { |i| i * 2 }.then { |i| i - 1 }.execute # new framework

##
# Concurrent::TimerTask
#
opts = { execution_interval: 1, timeout_interval: 5 }
task = Concurrent::TimerTask.new(opts) { puts Time.now }
task.execute && sleep(5) && task.shutdown # prints time 4 times

##
# Concurrent::ScheduledTask
#
delay_seconds = 3
task = Concurrent::ScheduledTask.execute(delay_seconds) { puts Time.now }
sleep(5) && puts("Executed after #{delay_seconds} sec, state=#{task.state}")

##
# Concurrent::DependentTask
#
#                 load_users <- load_devices
#                /
# load_data_async              load_summaries
#                \            /
#                 load_threats
#                             \
#                              load_descriptions
#
wait = ->(delay, message) { sleep(delay); puts(message) }

load_devices = Concurrent.dataflow { wait.(5, 'load_devices') }
load_summaries = Concurrent.dataflow { wait.(4, 'load_summaries') }
load_descriptions = Concurrent.dataflow { wait.(6, 'load_descriptions') }

load_users = Concurrent.dataflow(load_devices) { wait.(1, 'load_users') }
load_threats = Concurrent.dataflow(load_summaries, load_descriptions) { wait.(1, 'load_threats') }
load_data_async = Concurrent.dataflow(load_users, load_threats) { wait.(1, 'complete') }; sleep(10)

##
# Concurrent::DataStructures
#
[Concurrent::Delay, Concurrent::Maybe]
[Concurrent::Map, Concurrent::Set, Concurrent::Hash, Concurrent::Array, Concurrent::Tuple]
