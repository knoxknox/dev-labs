defmodule Crawler.Http.Circl do
  @url "https://cve.circl.lu/api/cve"

  def get(cve_id) do
    url = "#{@url}/#{cve_id}"
    data = request(url) |> Jason.decode!

    Map.take(data, ["cvss", "cvss-time", "references"])
  end

  defp request(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} -> body
      error -> raise "Could not fetch data from #{url}: #{inspect(error)}"
    end
  end
end
