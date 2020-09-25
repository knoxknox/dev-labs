defmodule Crawler.Http.ClientTest do
  use ExUnit.Case
  @subject Crawler.Http.Client
  @server_url "http://localhost:8080"

  test "should return response when 200" do
    expected_response = Jason.encode!(%{response: "OK"})
    assert {:ok, expected_response} == @subject.get("#{@server_url}/health")
  end

  test "should return error message when 404" do
    {:error, response} = @subject.get("#{@server_url}/unknown")
    assert response =~ "Error, could not fetch data from #{@server_url}/unknown"
  end
end
