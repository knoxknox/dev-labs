defmodule Crawler.Requests.DebianTest do
  import Mox
  use ExUnit.Case
  @subject Crawler.Requests.Debian

  test "returns decoded response on success" do
    data = %{socks4: %{"CVE-5147" => true}}
    mock_response = {:ok, Jason.encode!(data)}
    expect(Crawler.Http.ClientMock, :get, fn _ -> mock_response end)

    assert @subject.get == {:ok, %{"socks4" => %{"CVE-5147" => true}}}
  end

  test "returns error with message on failure" do
    mock_response = {:error, "Oops. Something went wrong (500)"}
    expect(Crawler.Http.ClientMock, :get, fn _ -> mock_response end)

    assert @subject.get == {:error, "Oops. Something went wrong (500)"}
  end
end
