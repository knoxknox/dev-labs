##
# Iteration in Elixir.
#
defmodule Enumeration do
  def each([], _func), do: nil
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def reduce([], total, _func), do: total
  def reduce([head | tail], total, func) do
    reduce(tail, func.(head, total), func)
  end
end

Enumeration.each([1, 2, 3], &IO.puts/1)
Enumeration.reduce([1, 2, 3], 0, fn(value, total) -> value + total end) |> IO.puts
