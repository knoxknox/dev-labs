defmodule Vulnerabilities.MixProject do
  use Mix.Project

  def project do
    [
      deps: [],
      version: "0.1.0",
      apps_path: "apps",
      start_permanent: Mix.env() == :prod
    ]
  end
end
