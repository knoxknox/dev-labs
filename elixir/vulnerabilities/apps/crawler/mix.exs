defmodule Crawler.MixProject do
  use Mix.Project

  def project do
    [
      app: :crawler,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.10",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Crawler.App, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.7"},
      {:mox, "~> 1.0", only: :test}
    ]
  end
end
