defmodule Cluster.Mixfile do
  use Mix.Project

  def project do
    [
      deps: deps(),
      app: :cluster,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env == :prod
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:gproc, "~> 0.8.0"}
    ]
  end
end
