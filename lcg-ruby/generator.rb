##
# LCG algorithm.
# X(n+1) = (Xn * a + c) % m
#
# m - must be greater than 0 (m > 0)
# a - must be greater than 0 and less than m (0 < a < m)
# c - must be greater than or equal to 0 and less than m (0 <= c < m)
# X0 - must be greater than or equal to 0 and less than m (0 <= X0 < m)
#
class LCG
  def initialize(args = {})
    @a = args.fetch(:a)
    @c = args.fetch(:c)
    @m = args.fetch(:m)
    @xn = args.fetch(:xn)
    validate_input_arguments!
  end

  def generate
    @xn = (@xn * @a + @c) % @m
  end


  private

  def validate_input_arguments!
    raise ArgumentError('incorrect m') if (@m <= 0)
    raise ArgumentError('incorrect a') if (@a <= 0) || (@a >= @m)
    raise ArgumentError('incorrect c') if (@c <  0) || (@c >= @m)
    raise ArgumentError('incorrect x') if (@xn < 0) || (@xn >= @m)
  end
end
