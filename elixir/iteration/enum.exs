##
# Iteration in Elixir.
#
# How data is organized:
# [1 | []]                           => [1]
# [1 | [2, 3]]                       => [1, 2, 3]
# [1 | [2 | [3, 4, 5]]]              => [1, 2, 3, 4, 5]
# [1 | [2 | [3 | [4 | [5 | []]]]]]   => [1, 2, 3, 4, 5]
#
# How to iterate over data:
# [
#   1 | [                            => head=1, tail=[2..]
#     2 | [                          => head=2, tail=[3..]
#       3 | [                        => head=3, tail=[4..]
#         4 | [                      => head=4, tail=[5..]
#           5 | []                   => head=5, tail=[end]
#         ]
#       ]
#     ]
#   ]
# ] => the same as [1, 2, 3, 4, 5], due to [1 | []] == [1]
#
# Example of [head | tail] iteration:
# list = [1, 2, 3]
# [head | tail] = list               => head=1, tail=[2, 3]
# [head | tail] = tail               => head=2, tail=[3, []]
# [head | tail] = tail               => head=3, tail=[empty]
#
defmodule Enumeration do
  def each([], _func), do: nil
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def map([], _func), do: []
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def reduce([], total, _func), do: total
  def reduce([head | tail], total, func) do
    reduce(tail, func.(head, total), func)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    result = func.(head)
    if result, do: [head | filter(tail, func)], else: filter(tail, func)
  end
end

Enumeration.each([1, 2, 3], &IO.puts/1) |> IO.inspect
Enumeration.map([1, 2, 3], fn(value) -> value * 2 end) |> IO.inspect
Enumeration.filter([1, 2, 3], fn(value) -> value > 1 end) |> IO.inspect
Enumeration.reduce([1, 2, 3], 0, fn(value, total) -> value + total end) |> IO.inspect
