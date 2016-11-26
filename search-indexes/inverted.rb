require 'set'

class Index
  def initialize
    @inverted_index = {}
  end

  def interpolate(tuples)
    tuples.each do |tuple|
      identifier = tuple.first

      1.upto(tuple.size - 1) do |i|
        @inverted_index[tuple[i]] ||= Set.new
        @inverted_index[tuple[i]] << identifier
      end
    end
  end
end
