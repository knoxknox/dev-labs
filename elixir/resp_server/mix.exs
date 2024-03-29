defmodule RespServer.Mixfile do
  use Mix.Project

  def project do
    [
      deps: deps(),
      version: "1.0.0",
      elixir: "~> 1.14",
      app: :resp_server,
      start_permanent: Mix.env() == :prod
    ]
  end

  def application do
    [
      mod: {RespServer.App, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:redix, "~> 1.3"}
    ]
  end
end
