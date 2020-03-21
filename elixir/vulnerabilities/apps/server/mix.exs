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
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Server, []},
      extra_applications: [:logger, :cowboy, :plug, :poison]
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.9"},
      {:poison, "~> 4.0"},
      {:cowboy, "~> 2.7"},
      {:plug_cowboy, "~> 2.1"}
    ]
  end
end
