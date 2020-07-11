defmodule Replication.Mixfile do
  use Mix.Project

  def project do
    [
      deps: [],
      app: :replication,
      version: "1.0.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env == :prod
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
