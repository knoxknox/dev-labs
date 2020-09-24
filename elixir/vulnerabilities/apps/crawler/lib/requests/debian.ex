defmodule Crawler.Requests.Debian do
  @client Crawler.Http.Client
  @url "https://security-tracker.debian.org/tracker/data/json"

  def get do
    case @client.get(@url) do
      {:ok, json} -> {:ok, Jason.decode!(json)}
      {:error, error_msg} -> {:error, error_msg}
    end
  end
end
