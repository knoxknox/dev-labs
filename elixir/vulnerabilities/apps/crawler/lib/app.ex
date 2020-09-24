defmodule Crawler.App do
  use Application
  @workers_count 4

  def start(_type, _args) do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  defp children do
    [
      %{
        type: :worker,
        id: Crawler.Processor,
        start: {Crawler.Processor, :start_link, [%{workers_count: @workers_count}]}
      }
    ]
  end
end
