defmodule Crawler.Http.Client do
  @behaviour Crawler.Http.Base

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} -> {:ok, body}
      {:error, %HTTPoison.Error{id: nil, reason: :closed}} -> {:error, :closed}
      {:error, %HTTPoison.Error{id: nil, reason: :timeout}} -> {:error, :timeout}
      {:ok, %HTTPoison.Response{body: _body, status_code: 429}} -> {:error, :retry}
      error -> {:error, "Error, could not fetch data from #{url}: #{inspect(error)}"}
    end
  end
end
