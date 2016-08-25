class BitArray

  def initialize
    @bitmask = 0
  end

  def [](index)
    @bitmask[index]
  end

  def set(*indexes)
    indexes.each do |index|
      @bitmask |= (1 << index)
    end
  end

end

# usage: 01110101
bit_array = BitArray.new
bit_array.set(0, 2, 4, 5, 6)
puts 7.downto(0).map { |i| bit_array[i] }.join
