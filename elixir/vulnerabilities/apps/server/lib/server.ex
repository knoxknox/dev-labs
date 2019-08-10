defmodule Server do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        plug: Router,
        scheme: :http,
        options: [port: 8080]
      )
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
