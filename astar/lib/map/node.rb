class Node
  attr_accessor :x, :y  # int
  attr_accessor :f, :g  # float
  attr_accessor :block  # boolean
  attr_accessor :parent # reference

  def initialize(x, y)
    @x = x
    @y = y
    @f = -1
    @g = -1
    @parent = nil
    @block = false
  end

  def distance(target_x, target_y)
    Distance.estimate(self, target_x, target_y)
  end
end
