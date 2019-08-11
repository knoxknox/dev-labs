defmodule Crawler do
  use Application
  @workers_count 16

  def start(_type, _args) do
    Crawler.Supervisor.start(@workers_count)
  end
end
