class Renderer
  attr_reader :grid, :current

  def initialize(grid, current)
    @grid, @current = grid, current
  end

  def render
    if current == nil
    map = Array.new(grid.size)
    0.upto(map.size - 1) do |i|
      map[i] = Array.new(grid.size) { '_' }
    end

    0.upto(map.size - 1) do |i|
      0.upto(map[i].size - 1) do |j|
        if (grid[i][j].block)
          map[i][j] = 'X'
        end
      end
    end
    map.each do |row|
      row.each do |sym|
        print "\e[#{31}m#{sym}\e[0m" + " " if sym == 'X'
        print "\e[#{37}m#{sym}\e[0m" + " " if sym == 'O'
        print "\e[#{34}m#{sym}\e[0m" + " " if sym == '_'
      end
      print "\n"
    end
      return false
    end

    current_node = current

    map = Array.new(grid.size)
    0.upto(map.size - 1) do |i|
      map[i] = Array.new(grid.size) { '_' }
    end

    0.upto(map.size - 1) do |i|
      0.upto(map.size - 1) do |j|
        if (grid[i][j].block)
          map[i][j] = 'X'
        end
      end
    end

    while (current_node.parent != nil) do
      map[current_node.y][current_node.x] = "O"
      current_node = current_node.parent
    end

    # initial node will be latest node in linked list
    initialNode = grid[current_node.y][current_node.x]
    map[initialNode.y][initialNode.x] = "O"

    map.each do |row|
      row.each do |sym|
        print "\e[#{31}m#{sym}\e[0m" + " " if sym == 'X'
        print "\e[#{37}m#{sym}\e[0m" + " " if sym == 'O'
        print "\e[#{34}m#{sym}\e[0m" + " " if sym == '_'
      end
      print "\n"
    end
    return true
  end

end
