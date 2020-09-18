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

## :sys.trace

Trace process calls and state change.
```elixir
iex> :sys.trace(pid, true)
iex> GenServer.call(pid, :next_number)
*DBG* <0.69.0> got call next_number from <0.25.0>
*DBG* <0.69.0> sent 105 to <0.25.0>, new state 106
```

## Process.info

Get information about a specific process.
```elixir
iex> Process.info(pid)
[
  ...
  messages: [],
  status: :waiting,
  trap_exit: false,
  priority: :normal,
  message_queue_len: 0,
  links: [#PID<0.610.0>],
  ...
]
```

## Process.whereis

Find process by name or specific process id.
```elixir
iex> Supervisor.which_children(:example_supervisor)
[
  {:example_children1, #PID<0.222.0>, :supervisor, []},
  {:example_children2, #PID<0.226.0>, :supervisor, []},
]
iex> Process.info(:c.pid(0,222,0))
[
  status: :waiting,
  registered_name: :example_children1,
  initial_call: {:proc_lib, :init_p, 5},
  current_function: {:gen_server, :loop, 7},
  links: [#PID<0.223.0>, #PID<0.234.0>, #PID<0.221.0>],
  ...
]
iex> Process.whereis(:example_children1) => #PID<0.222.0>
```

## :sys.get_state / :sys.get_status

:sys.get_state/1 gets the current state of a process.
```elixir
iex(1)> defmodule Example, do: use GenServer
iex(2)> {:ok, pid} = GenServer.start_link(Example, %{ping: "pong"})
iex(3)> :sys.get_state(pid)
%{ping: "pong"}
```

:sys.get_status/1 returns the whole process information.
```elixir
iex> :sys.get_status(pid)
{:status, #PID<0.134.0>, {:module, :gen_server}, [
  :running,
  #PID<0.118.0>,
  [
    "$ancestors": [#PID<0.118.0>, #PID<0.57.0>],
    "$initial_call": {Sequence.Server, :init, 1}
  ],
  [
    data: [{'State', 103}],
    data: [
      {'Status', :running},
      {'Logged events', []},
      {'Parent', #PID<0.118.0>}
    ],
    header: 'Status for generic server <0.134.0>'
  ]
]}
```
To replace process state at runtime use command `:sys.replace_state/2`.

## :observer

Overview of the running system.
```elixir
iex> :observer.start
iex> :observer_cli.start
```

## Distillery

Run commands after package release.
```elixir
$ bin/<app_name> <command>
$ bin/example_application help
$ bin/example_application remote_console
```

# Resources
- https://elixir-lang.org/getting-started/debugging.html
- https://www.pagerduty.com/eng/tracking-down-ets-related-memory-leak
- https://medium.com/@diamondgfx/debugging-phoenix-with-iex-pry-5417256e1d11
