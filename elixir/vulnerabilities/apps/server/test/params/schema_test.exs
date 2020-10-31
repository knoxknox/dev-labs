defmodule Server.Params.SchemaTest do
  use ExUnit.Case
  @subject Server.Params.Schema

  test "loads schema by name" do
    schema = @subject.load("schema")

    assert schema["type"] == "object"
    assert length(schema["required"]) > 0
    assert length(Map.keys(schema["properties"])) > 0
  end

  test "raises error when schema not found" do
    assert_raise File.Error, fn -> @subject.load("unknown") end
  end
end
