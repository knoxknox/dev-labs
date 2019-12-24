# Debug overview

Quick overview of debugging techniques.

## IO.inspect

```elixir
my_list = [1, 2, 3]
IO.inspect(my_list) # => [1, 2, 3]
```
```elixir
[1, 2, 3]
  |> IO.inspect(label: "s1")
  |> Enum.map(&(&1 * 2))
  |> IO.inspect(label: "s2")
  |> Enum.sum
# => s1: [1, 2, 3], s2: [2, 4, 6]
```

## IO.inspect (binding)

binding/1 shows variable names and values.
```elixir
def some_fun(a, b) do
  IO.inspect(binding())
  ...
end

iex> some_fun(:foo, "bar") # => [a: :foo, b: "bar"]
```

## IEx.pry

```elixir
def some_fun(a, b) do
  require IEx; IEx.pry
  ...
end
```
Run code with `iex -S mix` or `iex -S mix phx.server`.
