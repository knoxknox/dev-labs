def fib(n)
  return n if n < 2
  fib(n - 1) + fib(n - 2)
end

queue = Ractor.new do
  loop do
    Ractor.yield(Ractor.receive)
  end
end

4.times do |i|
  Ractor.new(queue, name: "actor-#{i}") do |queue|
    id = self.name.split('-').last
    puts "[#{id}] actor initialized"

    loop do
      number = queue.take
      puts "[#{id}] calculate value for #{number}"

      result = fib(number)
      puts "[#{id}] fibonacci number for #{number} = #{result}"
    end
  end
end

##
# Sending a message
# - ractor.send(message) - know your recipient
# - Ractor.yield(message) - don't know recipient
#
# Receiving a message
# - ractor.take - know a ref to actor sending the message
# - Ractor.receive - don't know who is sending the message
#
loop do
  input = gets.chomp
  queue.send(input.to_i)
end
