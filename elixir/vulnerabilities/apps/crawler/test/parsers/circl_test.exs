defmodule Crawler.Parsers.CirclTest do
  use ExUnit.Case
  @subject Crawler.Parsers.Circl

  test "parse when response is null" do
    response = nil
    expected_data = %{}
    assert @subject.call(response) == expected_data
  end

  test "parse when response is present" do
    response = %{
      "id" => "CVE-2015-0233",
      "assigner" => "cve@mitre.org",
      "cvss" => 4.6,
      "cvss-time" => "2017-09-08T11:56:00",
      "modified-time" => "2017-09-08T11:56:00",
      "published-time" => "2017-08-28T19:29:00",
      "summary" => "File vulnerabilities in server before 1.1.38.",
      "references" => [
        "https://bugzilla.redhat.com/show_bug.cgi?id=1183151",
        "http://lists.fedoraproject.org/pipermail/package-announce/2015-March/151954.html"
      ]
    }

    expected_data = %{
      "cvss" => 4.6,
      "cvss-time" => "2017-09-08T11:56:00",
      "references" => [
        "https://bugzilla.redhat.com/show_bug.cgi?id=1183151",
        "http://lists.fedoraproject.org/pipermail/package-announce/2015-March/151954.html"
      ]
    }

    assert @subject.call(response) == expected_data
  end
end
