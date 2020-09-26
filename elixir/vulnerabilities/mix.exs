defmodule Vulnerabilities.MixProject do
  use Mix.Project

  def project do
    [
      deps: deps(),
      version: "0.1.0",
      apps_path: "apps",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.13", only: :test}
    ]
  end
end
