defmodule Crawler.Parsers.Debian do
  def call(response) do
    collect_packages(response)
  end

  defp collect_cve_releases(releases) do
    Enum.map(releases, fn({name, details}) ->
      %{
        "release" => name,
        "status" => details["status"],
        "fixed_version" => details["fixed_version"]
      }
    end)
  end

  defp collect_cve_info_per_package(cve_info) do
    %{
      "description" => cve_info["description"],
      "releases" => collect_cve_releases(cve_info["releases"])
    }
  end

  defp collect_packages(packages) do
    Enum.reduce(packages, %{}, fn({package_name, cves}, result) ->
      Map.put(result, package_name, collect_cves_per_package(cves))
    end)
  end

  defp collect_cves_per_package(cves) do
    Enum.reduce(cves, %{}, fn({cve_id, cve_info}, result) ->
      Map.put(result, cve_id, collect_cve_info_per_package(cve_info))
    end)
  end
end
