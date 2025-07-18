##
# Block
# Syntactic structure, not an object.
#

puts [1, 2, 3].map { |i| i + 1 } # => [2, 3, 4]

##
# Proc / Lambda
# ->() {} - Proc object with is_lambda=true
# Proc.new {} - Proc object with is_lambda=false
#

puts ->(a, b) { a + b }.call(1, 2) # => 3
puts lambda { |a, b| a + b }.call(1, 2) # => 3
puts Proc.new { |a, b| a + b }.call(1, 2) # => 3

# Arity Checking
puts ->(a, b) { a.to_i + b.to_i }.call(1) # => error (strict)
puts Proc.new { |a, b| a.to_i + b.to_i }.call(1) # => 1 (not strict)

# Return Behavior
def test_when_lambda_is_true
  lambda { return 1 }.call
  return 0
end

def test_when_lambda_is_false
  Proc.new { return 1 }.call
  return 0
end

puts test_when_lambda_is_true # => 0 (return happens from method)
puts test_when_lambda_is_false # => 1 (return happens from the proc)
