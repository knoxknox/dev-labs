defmodule Crawler.Processor do
  use GenServer
  @name :processor
  @timeout :timer.seconds(30)
  alias Crawler.{Logger, TasksCounter}

  def init(state) do
    TasksCounter.init()
    {:ok, %{max_concurrency: state[:workers_count]}}
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: @name)
  end

  def execute do
    TasksCounter.reset()
    GenServer.cast(@name, :execute)
  end

  def handle_cast(:execute, state) do
    tasks = tasks_list()
    tasks_count = Enum.count(tasks)
    async_stream(tasks, tasks_count, state[:max_concurrency])

    {:noreply, state}
  end

  defp handle_task({package, cves}, tasks_count) do
    process = self()
    TasksCounter.increment(1)

    Enum.each(cves, fn({cve_id, _cve}) ->
      case Crawler.Requests.Circl.get(cve_id) do
        {:ok, data} -> Crawler.Parsers.Circl.call(data)
        {:error, error} -> raise "Error in processing: #{inspect(error)}"
      end
    end)
  end

  defp tasks_list do
    case Crawler.Requests.Debian.get() do
      {:ok, data} -> Crawler.Parsers.Debian.call(data)
      {:error, error} -> raise "Error in processing: #{inspect(error)}"
    end
  end

  defp async_stream(tasks, tasks_count, max_concurrency) do
    options = [timeout: @timeout, max_concurrency: max_concurrency]
    tasks |> Task.async_stream(& handle_task(&1, tasks_count), options) |> Stream.run
  end
end
