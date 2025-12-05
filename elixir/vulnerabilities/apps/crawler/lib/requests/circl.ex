defmodule Crawler.Requests.Circl do
  @retry_after :timer.seconds(10)
  @url "https://vulnerability.circl.lu/api/vulnerability"

  def get(cve_id, retries \\ 3) do
    case client().get("#{@url}/#{cve_id}") do
      {:ok, json} -> {:ok, Jason.decode!(json)}
      {:error, :retry} -> retry_after(cve_id, retries)
      {:error, :closed} -> retry_after(cve_id, retries)
      {:error, :timeout} -> retry_after(cve_id, retries)
      {:error, error_message} -> {:error, error_message}
    end
  end

  defp retry_after(cve_id, retry_count) do
    if retry_count > 0 do
      Process.sleep(@retry_after)
      get(cve_id, retry_count - 1)
    else
      {:error, "Reached the max number of query retries"}
    end
  end

  def client do
    Application.get_env(:crawler, :http_client, Crawler.Http.Client)
  end
end
