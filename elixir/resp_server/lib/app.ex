defmodule RespServer.App do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  defp children do
    [
      Supervisor.child_spec({Task, fn -> RespServer.Conn.accept(3211) end}, restart: :permanent)
    ]
  end
end
