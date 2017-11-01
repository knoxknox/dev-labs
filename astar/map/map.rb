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
    grid = Array.new(size)

    0.upto(size - 1) do |i|
      grid[i] = Array.new(size)
    end

    0.upto(size - 1) do |i|
      0.upto(size - 1) do |j|
        grid[i][j] = Node.new(j, i)
      end
    end

    grid
  end

end
