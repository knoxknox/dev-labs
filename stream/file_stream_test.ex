defmodule DelayWriter do
  def write(path, time_msec, sequence) do
    receive do
    after
      time_msec -> write_sequence(path, sequence)
    end
  end

  defp write_sequence(path, sequence) do
    Enum.each(sequence, fn(i) -> File.write(path, "Line#{i}\n", [:append]) end)
  end
end

path = "/tmp/example"
File.write(path, "Line0\n", [:write])
spawn fn -> DelayWriter.write(path, 1_000, 1..5) end
spawn fn -> DelayWriter.write(path, 1_000, 5..10) end
spawn fn -> DelayWriter.write(path, 2_000, 10..15) end
spawn fn -> DelayWriter.write(path, 3_000, 15..20) end
spawn fn -> DelayWriter.write(path, 5_000, 20..25) end

FileStream.create(path) |> Stream.map(fn(x) -> IO.puts(inspect(x)) end) |> Stream.run()
