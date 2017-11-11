##
# Builds a list of points from start node to target.
# Internally it's a hash for fast coordinates lookup.
# {'00' => [0,0], '01' => [0,1], '02' => [0,2], etc..}
#
class Points

  def initialize(node)
    @result = Hash.new
    @current_node = node
  end

  def build
    iterate_list
    add_new_point

    @result
  end


  private

  def key
    "#{@current_node.y}:#{@current_node.x}"
  end

  def iterate_list
    while (@current_node.parent != nil) do
      add_new_point
      @current_node = @current_node.parent
    end
  end

  def add_new_point
    @result[key] = [@current_node.y, @current_node.x]
  end

end
