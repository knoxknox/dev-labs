class Enumer
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def each
    for i in list do
      yield i
    end
  end

  def each_with_index
    index = 0
    each do |i|
      yield i, index
      index = index + 1
    end
  end

  def sum
    result = 0
    each do |i|
      result += i
    end
    result
  end

  def count
    result = 0
    each do |i|
      result += 1
    end
    result
  end

  def map(&block)
    result = []
    each do |i|
      result << block.call(i)
    end
    result
  end

  def all?(&block)
    result = true
    each do |i|
      result &= block.call(i)
    end
    result
  end

  def any?(&block)
    each do |i|
      return true if block.call(i)
    end
    false
  end

  def select(&block)
    result = []
    each do |i|
      result.push(i) if block.call(i)
    end
    result
  end

  def inject(memo = 0, &block)
    memo = list[0]
    1.upto(list.size - 1) do |i|
      memo = block.call(memo, list[i])
    end
    memo
  end
end

enumer = Enumer.new([10, 20, 30])
enumer.each { |i| puts i }
enumer.each_with_index { |i, idx| puts idx, i }
puts enumer.sum
puts enumer.count
puts enumer.map { |i| i + 1 }
puts enumer.all? { |i| i > 15 }
puts enumer.any? { |i| i > 15 }
puts enumer.select { |i| i > 15 }
puts enumer.inject { |memo, i| memo + i }
