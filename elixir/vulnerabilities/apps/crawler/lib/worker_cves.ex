defmodule Crawler.WorkerCves do
  use GenServer
  @name :crawler

  def init(state) do
    {:ok, state}
  end

  def start_link(state) do
    link(@name, state)
  end

  def execute do
    GenServer.cast(@name, :execute)
  end

  def handle_cast(:execute, pool_size) do
    pids = fetch_from_pool(pool_size)
    try do
      tasks = 100_000
      enqueue(pids, tasks)
    after
      return_to_pool(pids)
      Crawler.Logging.pool_status(:workers)
    end

    {:noreply, pool_size}
  end

  defp enqueue(pids, tasks_count) do
    Enum.each 1..tasks_count, fn(_) ->
      worker = Enum.random(pids)
      random_arg = :rand.uniform(100)
      Crawler.Logging.enqueue(worker, random_arg)
      Crawler.WorkerCve.execute(worker, random_arg)
    end
  end

  defp link(name, state) do
    GenServer.start_link(__MODULE__, state, name: name)
  end

  defp return_to_pool(pids) do
    Enum.map(pids, fn(pid) -> :poolboy.checkin(:workers, pid) end)
  end

  defp fetch_from_pool(pool_size) do
    Enum.map(1..pool_size, fn(_) -> :poolboy.checkout(:workers) end)
  end

end
