class Map

  def initialize(size)
    @grid = create_map(size)
  end

  def size
    @grid.size
  end

  def [](idx)
    @grid[idx]
  end

  def at(x, y)
    @grid[y - 1][x - 1]
  end

  def fill(x, y)
    @grid[x][y].block = true
  end


  private

  def create_map(size)
    Array.new(size) do |i|
      Array.new(size) { |j| Node.new(j, i) }
    end
  end

end
