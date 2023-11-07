defmodule Server.App do
  use Application
  @plug Server.Router

  def start(_type, _args) do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  defp children do
    [
      Plug.Cowboy.child_spec(plug: @plug, scheme: :http, options: [port: 8080])
    ]
  end
end
