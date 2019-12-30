defmodule FileStream do
  @end_of_stream "\e\n"
  @file_inactivity_limit_sec 5
  @next_chunk_wait_time_msec 1_000
  @monitor_file_for_close_msec 10_000

  def create(path) do
    Stream.resource(
      fn -> open_stream(path) end,
      fn(file) -> read_stream(file) end,
      fn(file) -> close_stream(file) end
    )
  end

  defp open_stream(path) do
    file = File.open!(path)
    spawn fn -> ensure_close(path) end

    file
  end

  defp close_stream(file) do
    if Process.alive?(file), do: File.close(file)
  end

  defp read_stream(file) do
    case IO.read(file, :line) do
      :eof ->
        wait_io()
        {[], file}
      @end_of_stream -> {:halt, file}
      current_io_line -> {[current_io_line], file}
    end
  end

  defp wait_io() do
    Process.sleep(@next_chunk_wait_time_msec) # decreases `IO.read` calls
  end

  defp ensure_close(path) do
    receive do
    after
      @monitor_file_for_close_msec ->
        {:ok, file} = File.stat(path, [{:time, :posix}])
        continue = :os.system_time(:second) - file.mtime < @file_inactivity_limit_sec
        if continue, do: ensure_close(path), else: File.write(path, @end_of_stream, [:append])
    end
  end

end
