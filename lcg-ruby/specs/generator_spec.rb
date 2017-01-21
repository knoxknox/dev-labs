##
# Linear congruential generator spec.
#

lcg = LCG.new(a: 5, c: 3, xn: 7, m: 16)
actual = 10.times.each_with_object([]) { |x, memo| memo << lcg.generate }
raise 'Assertion failed!' if actual != [6, 1, 8, 11, 10, 5, 12, 15, 14, 9]

lcg = LCG.new(a: 5, c: 3, xn: 7, m: 16)
actual = 10.times.each_with_object([]) { |x, memo| memo << lcg.generate }
raise 'Assertion failed!' if actual != [6, 1, 8, 11, 10, 5, 12, 15, 14, 9]
