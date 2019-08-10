defmodule Crawler.Logging do

  def puts(string) do
    IO.ANSI.format(string) |> IO.puts
  end

  def pool_status(name) do
    puts([
      :white, "#{inspect :poolboy.status(name)}"
    ])
  end

  def enqueue(worker, arg) do
    puts([
      :light_blue, "#{inspect worker}",
      :light_black, " accepted task with arg=#{arg}",
      :light_black, " #{inspect :poolboy.status(:workers)}"
    ])
  end

  def handle_success(process, pool_size, queue_size, message) do
    puts([
      :green, "#{inspect process}",
      :light_white, " #{elem(queue_size, 1)}",
      :light_black, " respond with=#{message}",
      :light_black, " pool=#{inspect pool_size}"
    ])
  end

  def handle_failure(process, pool_size, queue_size, message) do
    puts([
      :red, "#{inspect process}",
      :light_white, " #{elem(queue_size, 1)}",
      :light_black, " respond with=#{message}",
      :light_black, " pool=#{inspect pool_size}"
    ])
  end

end
