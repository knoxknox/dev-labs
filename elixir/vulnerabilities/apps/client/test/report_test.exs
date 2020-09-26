defmodule Client.ReportTest do
  use ExUnit.Case
  @subject Client.Report
  @expected_header "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

  test "returns xml document for empty data" do
    assert @subject.generate(%{}) == @expected_header
  end

  test "returns xml document for primitive values" do
    assert @subject.generate(%{id: nil}) == "#{@expected_header}<id/>"
    assert @subject.generate(%{id: 100}) == "#{@expected_header}<id>100</id>"
    assert @subject.generate(%{id: true}) == "#{@expected_header}<id>true</id>"
    assert @subject.generate(%{id: "test"}) == "#{@expected_header}<id>test</id>"
  end

  test "returns xml document for array of values" do
    fields = %{ids: ["100", "200", "300"]}
    expected_values = Enum.map(fields[:ids], &"<value>#{&1}</value>")
    assert @subject.generate(fields) == "#{@expected_header}<ids>#{expected_values}</ids>"
  end

  test "returns xml document for nested map (nesting=1)" do
    fields = %{id: 100, user: %{name: "test"}}
    assert @subject.generate(fields) == "#{@expected_header}<id>100</id><user><name>test</name></user>"
  end

  test "returns xml document for nested map (nesting=2)" do
    fields = %{id: %{nested: %{name: "test"}}}
    assert @subject.generate(fields) == "#{@expected_header}<id><nested><name>test</name></nested></id>"
  end
end
