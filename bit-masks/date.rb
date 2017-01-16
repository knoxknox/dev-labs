class BitDate
  def initialize
    @date       = 0b00000000000000000000000
    @day_mask   = 0b00000000000000000011111
    @year_mask  = 0b11111111111111000000000
    @month_mask = 0b00000000000000111100000
  end

  def day
    (@date & @day_mask) >> 0
  end

  def year
    (@date & @year_mask) >> 9
  end

  def month
    (@date & @month_mask) >> 5
  end

  def day=(value)
    @date = (@date & ~@day_mask) | (value << 0)
  end

  def year=(value)
    @date = (@date & ~@year_mask) | (value << 9)
  end

  def month=(value)
    @date = (@date & ~@month_mask) | (value << 5)
  end
end
