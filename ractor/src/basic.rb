ractor1 = Ractor.new(name: 'ractor1') do
  puts "actor `#{self.name}` started #{self.inspect}"

  sleep(1)
  2 * Ractor.receive # receive reads a value sent to actor <= 10
end

ractor2 = Ractor.new(name: 'ractor2') do
  puts "actor `#{self.name}` started #{self.inspect}"

  sleep(2)
  2 * Ractor.receive # receive reads a value sent to actor <= 20
end

ractor1.send(10)
ractor2.send(20)

ractors = [ractor1, ractor2]
ractors_names = ractors.map(&:name)
ractors_results = ractors.map(&:take) # wait all for completion

puts "Result of execution is #{Hash[ractors_names.zip(ractors_results)]}"
