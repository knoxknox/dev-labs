defmodule Server.Params.ValidatorTest do
  use ExUnit.Case
  @subject Server.Params.Validator

  setup_all do
    {:ok, message: %{
      "id" => "CVE-2019-13509",
      "package" => "docker.io",
      "cvss" => 5.0,
      "cvss-time" => "2019-08-27T17:15:00",
      "description" => "Docker Engine in debug mode add secrets to the log",
      "references" => [
        "http://www.securityfocus.com/bid/109253",
        "https://seclists.org/bugtraq/2019/Sep/21",
        "https://docs.docker.com/engine/release-notes",
        "https://www.debian.org/security/2019/dsa-4521"
      ],
      "releases" => [
        %{"fixed_version" => "18.09.1+dfsg1-8", "release" => "sid", "status" => "resolved"},
        %{"fixed_version" => "18.09.1+dfsg1-7", "release" => "buster", "status" => "resolved"},
        %{"fixed_version" => "18.09.1+dfsg1-8", "release" => "bullseye", "status" => "resolved"}
      ]
    }}
  end

  describe "success case" do
    test "should return message", context do
      message = context[:message]
      assert @subject.call(message) == {:ok, message}
    end
  end

  describe "missing required fields" do
    test "should return validation errors", _context do
      message = %{}
      {:error, errors} = @subject.call(message)
      expected_message = ~r/Required properties.*were not present/

      assert List.first(errors) |> String.match?(expected_message)
    end
  end
end
