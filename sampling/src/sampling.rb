##
# Reservoir Sampling algorithm:
# - https://www.youtube.com/watch?v=Buzn4tQz-ZY
# - https://en.wikipedia.org/wiki/Reservoir_sampling
#
class Reservoir
  attr_reader :samples

  def initialize(max_size)
    @i = 0
    @samples = []
    @max_size = max_size
  end

  def add(element)
    @i += 1
    size = @samples.size

    if size < @max_size
      @samples << element
    else
      spot = rand(0..@i)
      if spot < size
        @samples[spot] = element
      end
    end
  end
end
