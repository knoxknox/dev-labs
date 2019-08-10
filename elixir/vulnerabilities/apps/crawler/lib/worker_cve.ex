defmodule Crawler.WorkerCve do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def execute(pid, number) do
    GenServer.cast(pid, {:execute, number})
  end

  def handle_cast({:execute, number}, state) do
    random_sleep()
    process = self()
    pool_size = :poolboy.status(:workers)
    queue_size = Process.info(process, :message_queue_len)

    try do
      random_error()
      Crawler.Logging.handle_success(process, pool_size, queue_size, number)
    rescue
      e -> Crawler.Logging.handle_failure(process, pool_size, queue_size, e.message)
    end

    {:noreply, state}
  end

  defp random_error do
    random = :rand.uniform(100)
    if random > 50 do
      raise "Something bad happened in processing entry"
    end
  end

  defp random_sleep do
    :timer.sleep(Enum.random(1..100) + Enum.random(1..200))
  end

end
