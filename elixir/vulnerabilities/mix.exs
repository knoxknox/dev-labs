defmodule Vulnerabilities.MixProject do
  use Mix.Project

  def project do
    [
      deps: deps(),
      version: "0.1.0",
      apps_path: "apps",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      releases: [
        vulnerabilities: [
          version: "0.1.0",
          include_erts: true,
          include_executables_for: [:unix],
          applications: [server: :permanent]
        ]
      ]
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.14", only: :test}
    ]
  end
end
