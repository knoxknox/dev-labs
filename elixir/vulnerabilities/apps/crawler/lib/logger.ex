defmodule Crawler.Logger do
  def puts(string) do
    IO.ANSI.format(string) |> IO.puts()
  end

  def status(processed, total_count) do
    puts([
      :green, "Processed:",
      :light_white, " #{processed}/#{total_count}"
    ])
  end

  def enqueue(pid, package, cve_id) do
    puts([
      :light_black,
      "#{inspect(pid)} Process #{cve_id} for package #{package}"
    ])
  end

  def success(pid, package, cve_id, message) do
    puts([
      :light_black,
      "#{inspect(pid)} Succeed #{cve_id} for package #{package} with #{inspect(message)}"
    ])
  end

  def failure(pid, package, cve_id, message) do
    puts([
      :red, "#{inspect(pid)}",
      :light_black, " Failured to process #{cve_id} for package #{package} with #{inspect(message)}"
    ])
  end
end
