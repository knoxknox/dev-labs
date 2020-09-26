defmodule Crawler.Requests.CirclTest do
  import Mox
  use ExUnit.Case
  @subject Crawler.Requests.Circl

  test "returns decoded response on success" do
    data = %{id: 42, summary: "CVE#42"}
    mock_response = {:ok, Jason.encode!(data)}
    expect(Crawler.Http.ClientMock, :get, fn _ -> mock_response end)

    assert @subject.get(42) == {:ok, %{"id" => 42, "summary" => "CVE#42"}}
  end

  test "returns error with message on failure" do
    mock_response = {:error, "Oops. Something went wrong (500)"}
    expect(Crawler.Http.ClientMock, :get, fn _ -> mock_response end)

    assert @subject.get(42) == {:error, "Oops. Something went wrong (500)"}
  end
end
