# Actor example

defmodule Actor do
  def init(counter \\ 0), do: loop(counter)

  def loop(counter) do
    result = receive do
      message -> receive_message(counter, message)
    end

    loop(result)
  end

  defp receive_message(counter, {:stats}), do: IO.puts(counter)
  defp receive_message(counter, {:increment, value}), do: counter + value
  defp receive_message(counter, {:decrement, value}), do: counter - value
end

pid = spawn(Actor, :init, [0])
send(pid, {:increment, 1}) # 0 + 1
send(pid, {:increment, 2}) # 1 + 2
send(pid, {:increment, 3}) # 3 + 3
send(pid, {:decrement, 4}) # 6 - 4
IO.write("Counter = ") && send(pid, {:stats})

# Task example

tasks = [
  Task.async(fn -> 0 + 1 end),
  Task.async(fn -> 1 + 2 end),
  Task.async(fn -> 2 + 3 end),
]

# Enum.map(tasks, &Task.async/1)
tasks_results = Task.await_many(tasks)
IO.puts("Counter = #{Enum.sum(tasks_results)}")

# Agent example

{:ok, _pid} = Agent.start_link(fn -> 0 end, name: :counter)

Agent.update(:counter, fn current_value -> current_value + 1 end)
Agent.update(:counter, fn current_value -> current_value + 2 end)
Agent.update(:counter, fn current_value -> current_value + 3 end)
result = Agent.get(:counter, fn current_value -> current_value end)

IO.puts("Counter = #{result} (shared state across multiple processes)")
