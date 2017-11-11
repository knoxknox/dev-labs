class Printer

  def print_n
    print "\n"
  end

  def print_row(type)
    print "\e[#{colors[type]}m#{objects[type]}\e[0m "
  end


  private

  def colors
    @colors ||= { Cell::WALL => 31, Cell::EMPTY => 34, Cell::ROUTE => 37 }
  end

  def objects
    @objects ||= { Cell::WALL => 'X', Cell::EMPTY => '_', Cell::ROUTE => 'O' }
  end

end
