class Renderer

  def initialize(grid, node)
    @grid = grid
    @printer = Printer.new
    @node = node || fail('no route')
    @points = Points.new(@node).build
  end

  def render
    iterate do |i|
      iterate do |j|
        type = get_type(i, j)
        @printer.print_row(type)
      end
      @printer.print_n
    end
  end


  private

  def iterate
    0.upto(@grid.size - 1) { |x| yield x }
  end

  def get_type(i, j)
    point = "#{i}:#{j}"
    return Cell::ROUTE if @points.key?(point)

    @grid[i][j].block ? Cell::WALL : Cell::EMPTY
  end

end
