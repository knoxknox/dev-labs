defmodule Replica do
  use GenServer
  require Logger
  alias Events.{Create, Balance, Register, Increment, Decrement}

  # Public API
  def balance(replica, name), do: GenServer.call(replica, %Balance{name: name})

  # GenServer API
  def start(name), do: GenServer.start(__MODULE__, name, name: name)
  def start_link(name), do: GenServer.start_link(__MODULE__, name, name: name)
  def init(name), do: GenServer.call(:master, %Register{name: name})

  def handle_cast(%Create{name: name}, state) do
    balance = state |> Map.get(name)
    new_state = if balance, do: state, else: state |> Map.put(name, 0)

    {:noreply, new_state}
  end

  def handle_call(%Balance{name: name}, _, state) do
    balance = state |> Map.get(name)
    reply = if balance, do: {:ok, balance}, else: {:error, :not_found}

    {:reply, reply, state}
  end

  def handle_cast(%Increment{name: name, amount: amount}, state) do
    previous_amount = state |> Map.get(name)
    new_state = if previous_amount, do: state |> Map.put(name, previous_amount + amount), else: state

    {:noreply, new_state}
  end

  def handle_cast(%Decrement{name: name, amount: amount}, state) do
    previous_amount = state |> Map.get(name)
    new_state = if previous_amount, do: state |> Map.put(name, previous_amount - amount), else: state

    {:noreply, new_state}
  end
end
