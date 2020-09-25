defmodule Client.ReportTest do
  use ExUnit.Case
  @subject Client.Report
  @expected_header "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

  test "return empty xml document for empty map" do
    assert @subject.generate(%{}) == @expected_header
  end

  test "return correct xml tag when value is empty" do
    assert @subject.generate(%{id: nil}) == "#{@expected_header}<id/>"
  end

  test "return correct xml document for default map" do
    assert @subject.generate(%{id: 100}) == "#{@expected_header}<id>100</id>"
    assert @subject.generate(%{id: true}) == "#{@expected_header}<id>true</id>"
    assert @subject.generate(%{id: "test"}) == "#{@expected_header}<id>test</id>"
  end

  test "return correct xml document for nested-1 map" do
    nested_map = %{id: 100, user: %{name: "test"}}
    assert @subject.generate(nested_map) == "#{@expected_header}<id>100</id><user><name>test</name></user>"
  end

  test "return correct xml document for nested-2 map" do
    nested_map = %{id: %{user: %{name: "test name"}}}
    assert @subject.generate(nested_map) == "#{@expected_header}<id><user><name>test name</name></user></id>"
  end
end
