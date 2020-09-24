defmodule Crawler.App do
  use Application
  @workers_count 16

  def start(_type, _args) do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  defp children do
    [
      %{
        type: :worker,
        id: Crawler.WorkerCves,
        start: {Crawler.WorkerCves, :start_link, [@workers_count]}
      }
    ]
  end
end
