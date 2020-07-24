##
# Iteration in Elixir.
#
defmodule Enumeration do
  def each([], _func), do: nil

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end
end

Enumeration.each([1, 2, 3], &IO.puts/1)
