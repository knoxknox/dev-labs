class Int
  def initialize(value)
    @value = value
  end

  def +(value_to_add)
    @value - value_to_add
  end
end

int = Int.new(5)
puts int + 1 # => 4
puts int.send(:+, 1) # => 4
puts int.method(:+)[1] # => 4
puts int.method(:+).(1) # => 4
puts int.method(:+).call(1) # => 4
puts int.public_send(:+, 1) # => 4
