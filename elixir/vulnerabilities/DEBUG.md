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
Run code with `iex -S mix` or `iex -S mix phx.server`.<br/>
Enter `respawn()` in pry to continue the rest of request execution.<br/>
Command to run tests `iex -S mix test --trace` w/o time out automatically.

## :debugger

:debugger like pry with ui
```elixir
defmodule App.Example do
  def calc(x, y) do
    (x + y) * (x + y) / 2
  end
end

iex> :debugger.start()            # start :debugger
iex> :int.ni(App.Example)         # prepare module for debugging
iex> :int.break(App.Example, 3)   # set a break point at the line 3
iex> App.Example.calc(1000, 2000) # call a function and start debugging
```
