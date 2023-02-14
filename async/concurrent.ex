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
