defmodule AppTest do
  use ExUnit.Case

  test "nodes synchronization" do
    App.start(:node1)
    App.start(:node2)
    App.start(:node3)
    App.start(:node4)
    App.create("JDoe")

    spawn fn ->
      for _ <- 1..100, do: spawn fn -> App.decrement("JDoe", 10) end
    end

    spawn fn ->
      for _ <- 1..1000, do: spawn fn -> App.increment("JDoe", 10) end
    end

    Process.sleep(1000) # synchronization waiting
    assert {:ok, 9000} == App.balance(:node1, "JDoe")
    assert {:ok, 9000} == App.balance(:node2, "JDoe")
    assert {:ok, 9000} == App.balance(:node3, "JDoe")
    assert {:ok, 9000} == App.balance(:node4, "JDoe")

    App.start(:node5)
    assert {:ok, 9000} == App.balance(:node5, "JDoe")
  end
end
