defmodule Crawler.Parsers.Circl do
  def call(response) do
    result = if response == nil, do: %{}, else: response
    result |> Map.take(["cvss", "cvss-time", "references"])
  end
end
