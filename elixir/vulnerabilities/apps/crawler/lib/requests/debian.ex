defmodule Crawler.Requests.Debian do
  @url "https://security-tracker.debian.org/tracker/data/json"

  def get do
    case client.get(@url) do
      {:ok, json} -> {:ok, Jason.decode!(json)}
      {:error, error_msg} -> {:error, error_msg}
    end
  end

  def client do
    Application.get_env(:crawler, :http_client, Crawler.Http.Client)
  end
end
