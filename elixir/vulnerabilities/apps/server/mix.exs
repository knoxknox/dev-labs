defmodule Server.MixProject do
  use Mix.Project

  def project do
    [
      app: :server,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.20",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Server.App, []},
      extra_applications: [:logger, :plug, :cowboy]
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.20"},
      {:jason, "~> 1.4"},
      {:cowboy, "~> 2.20"},
      {:plug_cowboy, "~> 2.9"},
      {:ex_json_schema, "~> 0.11"}
    ]
  end
end
