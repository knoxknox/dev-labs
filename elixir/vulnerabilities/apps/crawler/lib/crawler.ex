defmodule Crawler do
  use Application

  def start(_type, _args) do
    Crawler.Supervisor.start(16)
  end
end
