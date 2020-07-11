defmodule App do
  use GenServer
  require Logger
  alias Events.{Create, Balance, Register, Increment, Decrement}

  def create(name), do: notify(%Create{name: name})
  def balance(target, name), do: GenServer.call(target, %Balance{name: name})
  def increment(name, amount), do: notify(%Increment{name: name, amount: amount})
  def decrement(name, amount), do: notify(%Decrement{name: name, amount: amount})

  @cluster_name :main
  def start(name), do: GenServer.start(__MODULE__, name, name: name)
  def start_link(name), do: GenServer.start_link(__MODULE__, name, name: name)

  def init(name) do
    {:ok, balance} = init_state_for(name)
    Logger.info("#{inspect name} join to cluster")
    :gproc.reg({:p, :l, @cluster_name}) # {(p)roperty, (l)ocal, name}

    {:ok, balance}
  end

  defp notify(action) do
    :gproc.send({:p, :l, @cluster_name}, action) # {(p)roperty, (l)ocal, name}
  end

  defp init_state_for(node_name) do
    case :gproc.lookup_pids({:p, :l, @cluster_name}) do
      [first | _] -> GenServer.call(first, %Register{name: node_name})
      _ -> {:ok, %{}}
    end
  end

  def handle_call(%Register{}, _from, balances) do
    {:reply, {:ok, balances}, balances}
  end

  def handle_call(%Balance{name: name}, _from, balances) do
    balance = balances |> Map.get(name)
    reply = if balance, do: {:ok, balance}, else: {:error, :not_found}

    {:reply, reply, balances}
  end

  def handle_info(%Create{name: name}, balances) do
    exists = balances |> Map.has_key?(name)
    new_state = if exists, do: balances, else: balances |> Map.put(name, 0)

    {:noreply, new_state}
  end

  def handle_info(%Increment{name: name, amount: amount}, balances) do
    old_balance = balances |> Map.get(name)
    new_state = if old_balance, do: balances |> Map.put(name, old_balance + amount), else: balances

    {:noreply, new_state}
  end

  def handle_info(%Decrement{name: name, amount: amount}, balances) do
    old_balance = balances |> Map.get(name)
    new_state = if old_balance, do: balances |> Map.put(name, old_balance - amount), else: balances

    {:noreply, new_state}
  end
end
