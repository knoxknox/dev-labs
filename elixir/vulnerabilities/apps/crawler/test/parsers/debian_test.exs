defmodule Crawler.Parsers.DebianTest do
  use ExUnit.Case
  @subject Crawler.Parsers.Debian

  test "parse when response is empty" do
    response = %{}
    expected_data = %{}
    assert @subject.call(response) == expected_data
  end

  test "parse when response is present" do
    response = %{
      "socks4-server" => %{
        "CVE-2019-0053" => %{
          "debianbug" => 945861,
          "description" => "Insufficient validation of environment variables.",
          "releases" => %{
            "buster" => %{
              "nodsa" => "Minor issue",
              "nodsa_reason" => "ignored",
              "repositories" => %{"buster" => "4.3.beta2-20"},
              "status" => "open",
              "urgency" => "low"
            },
            "stretch" => %{
              "nodsa" => "Minor issue",
              "nodsa_reason" => "ignored",
              "repositories" => %{"stretch" => "4.3.beta2-20"},
              "status" => "open",
              "urgency" => "low"
            }
          },
          "scope" => "local"
        }
      },
      "ruby-redcarpet" => %{
        "CVE-2015-5147" => %{
          "description" => "Stack-based buffer overflow in the header_anchor function.",
          "releases" => %{
            "bullseye" => %{
              "fixed_version" => "0",
              "repositories" => %{"bullseye" => "3.5.0-2"},
              "status" => "resolved",
              "urgency" => "unimportant"
            },
            "buster" => %{
              "fixed_version" => "0",
              "repositories" => %{"buster" => "3.4.0-4"},
              "status" => "resolved",
              "urgency" => "unimportant"
            },
            "sid" => %{
              "fixed_version" => "0",
              "repositories" => %{"sid" => "3.5.0-2"},
              "status" => "resolved",
              "urgency" => "unimportant"
            },
            "stretch" => %{
              "fixed_version" => "0",
              "repositories" => %{"stretch" => "3.3.4-2"},
              "status" => "resolved",
              "urgency" => "unimportant"
            }
          },
          "scope" => "local"
        }
      }
    }

    expected_data = %{
      "socks4-server" => %{
        "CVE-2019-0053" => %{
          "description" => "Insufficient validation of environment variables.",
          "releases" => [
            %{
              "fixed_version" => nil,
              "release" => "buster",
              "status" => "open"
            },
            %{
              "fixed_version" => nil,
              "release" => "stretch",
              "status" => "open"
            }
          ]
        }
      },
      "ruby-redcarpet" => %{
        "CVE-2015-5147" => %{
          "description" => "Stack-based buffer overflow in the header_anchor function.",
          "releases" => [
            %{
              "fixed_version" => "0",
              "release" => "bullseye",
              "status" => "resolved"
            },
            %{
              "fixed_version" => "0",
              "release" => "buster",
              "status" => "resolved"
            },
            %{
              "fixed_version" => "0",
              "release" => "sid",
              "status" => "resolved"
            },
            %{
              "fixed_version" => "0",
              "release" => "stretch",
              "status" => "resolved"
            }
          ]
        }
      }
    }

    assert @subject.call(response) == expected_data
  end
end
