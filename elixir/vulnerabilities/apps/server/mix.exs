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
      elixir: "~> 1.9",
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
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:cowboy, "~> 1.0.0"},
      {:plug_cowboy, "~> 1.0"}
    ]
  end
end
