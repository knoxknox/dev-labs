defmodule AppTest do
  use ExUnit.Case

  test "balance should be 0 on create" do
    Master.start()
    Replica.start(:replica)

    Master.create("New")
    assert {:ok, 0} = Master.balance("New")
    assert {:ok, 0} = Replica.balance(:replica, "New")
  end

  test "properly move data to replicas" do
    Master.start()
    Replica.start(:replica1)
    Replica.start(:replica2)

    Master.create("JDoe")
    Master.increment("JDoe", 25)
    Master.increment("JDoe", 50)
    Master.increment("JDoe", 100)
    assert {:ok, 175} = Master.balance("JDoe")
    assert {:ok, 175} = Replica.balance(:replica1, "JDoe")
    assert {:ok, 175} = Replica.balance(:replica2, "JDoe")

    Master.decrement("JDoe", 75)
    assert {:ok, 100} = Master.balance("JDoe")
    assert {:ok, 100} = Replica.balance(:replica1, "JDoe")
    assert {:ok, 100} = Replica.balance(:replica2, "JDoe")
  end
end
