defmodule Master do
  use GenServer
  require Logger
  defmodule State, do: defstruct [:balances, :replicas]
  alias Events.{Create, Balance, Register, Increment, Decrement}

  # Public API
  def create(name), do: GenServer.cast(:master, %Create{name: name})
  def balance(name), do: GenServer.call(:master, %Balance{name: name})
  def increment(name, amount), do: GenServer.cast(:master, %Increment{name: name, amount: amount})
  def decrement(name, amount), do: GenServer.cast(:master, %Decrement{name: name, amount: amount})

  # GenServer API
  def start(), do: start(nil)
  def start(_), do: GenServer.start(__MODULE__, :none, name: :master)
  def start_link(_), do: GenServer.start_link(__MODULE__, :none, name: :master)

  def init(_), do: {:ok, %State{balances: %{}, replicas: []}}
  def broadcast(replicas, event), do: replicas |> Enum.each(fn replica -> GenServer.cast(replica, event) end)

  def handle_cast(
    %Create{name: name} = event,
    %State{balances: balances, replicas: replicas} = state) do

    balance = balances |> Map.get(name)
    new_state = if balance, do: balances, else: balances |> Map.put(name, 0)

    broadcast(replicas, event)
    {:noreply, %{state | balances: new_state}}
  end

  def handle_call(
    %Balance{name: name},
    _,
    %State{balances: balances} = state) do

    balance = balances |> Map.get(name)
    reply = if balance, do: {:ok, balance}, else: {:error, :not_found}

    {:reply, reply, state}
  end

  def handle_cast(
    %Increment{name: name, amount: amount} = event,
    %State{balances: balances, replicas: replicas} = state) do

    previous_amount = balances |> Map.get(name)
    new_state = if previous_amount, do: balances |> Map.put(name, previous_amount + amount), else: balances

    broadcast(replicas, event)
    {:noreply, %{state | balances: new_state}}
  end

  def handle_cast(
    %Decrement{name: name, amount: amount} = event,
    %State{balances: balances, replicas: replicas} = state) do

    previous_amount = balances |> Map.get(name)
    new_state = if previous_amount, do: balances |> Map.put(name, previous_amount - amount), else: balances

    broadcast(replicas, event)
    {:noreply, %{state | balances: new_state}}
  end

  def handle_call(
    %Register{name: name},
    _,
    %State{balances: balances, replicas: replicas} = state) do

    Process.monitor(name)
    Logger.info("Join #{inspect name} as replica")
    {:reply, {:ok, balances}, %{state | replicas: [name | replicas]}}
  end

  def handle_info(
    {:DOWN, ref, _, {name, _}, reason},
    %State{replicas: replicas} = state) do

    Process.demonitor(ref)
    Logger.info("Remove #{inspect name} (#{inspect reason})")
    {:noreply, %{state | replicas: List.delete(replicas, name)}}
  end
end
