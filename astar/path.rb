class Path
  attr_reader :open_set, :closed_set
  attr_reader :grid, :size, :start, :target

  def initialize(grid, points = {})
    @open_set = []
    @closed_set = []

    @grid = grid
    @size = grid.size
    @start = points.fetch(:start)
    @target = points.fetch(:target)
  end

  def find
    open_set.push(@start)
    @start.g = 0
    @start.f = @start.distance(@target.x, @target.y)

    shortcut = nil
    while (open_set.size > 0) do
      open_set.sort! { |a, b| a.f <=> b.f }
      current_node = open_set[0]

      if goal?(current_node)
        shortcut = current_node
        break
      end

      open_set.shift
      closed_set.push(current_node)

      (-1).upto(1) do |i|
        (-1).upto(1) do |j|
          next if out_of_bounds?(i, j, current_node)

          neighbour = grid[current_node.y + i][current_node.x + j]

          next if neighbour.block
          next if same_node?(i, j, current_node)
          next if closed_set.include?(neighbour)

          if (!open_set.include?(neighbour))
            open_set.push(neighbour)
          end

          neighbour.parent = current_node
          neighbour.g = neighbour.g + 1
          neighbour.f = neighbour.g + neighbour.distance(@target.x, @target.y)
        end
      end
    end

    shortcut
  end


  private

  def goal?(current_node)
    (current_node.x == @target.x) && (current_node.y == @target.y)
  end

  def same_node?(i, j, current_node)
    (current_node.y + i == current_node.y) && (current_node.x + j == current_node.x)
  end

  def out_of_bounds?(i, j, current_node)
    ((current_node.x + j) < 0) || ((current_node.x + j) > size-1) || ((current_node.y + i) < 0) || ((current_node.y + i) > size-1)
  end

end
