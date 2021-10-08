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
      elixir: "~> 1.12",
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
      {:plug, "~> 1.9"},
      {:jason, "~> 1.2"},
      {:cowboy, "~> 2.8"},
      {:plug_cowboy, "~> 2.3"},
      {:ex_json_schema, "~> 0.7"}
    ]
  end
end
