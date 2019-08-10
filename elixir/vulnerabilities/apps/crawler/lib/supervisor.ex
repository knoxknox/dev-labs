defmodule Crawler.Supervisor do
  @poolname :workers
  @strategy :one_for_one

  def start(pool_size) do
    import Supervisor.Spec

    children = [
      worker(Crawler.WorkerCves, [pool_size]),
      poolboy_worker_pool(pool_size, [pool_size])
    ]

    Supervisor.start_link(children, strategy: @strategy)
  end

  defp poolboy_worker_pool(size, args) do
    poolboy_config = [
      {:size, size},
      {:max_overflow, size * 2},
      {:name, {:local, @poolname}},
      {:worker_module, Crawler.WorkerCve}
    ]

    :poolboy.child_spec(@poolname, poolboy_config, args)
  end

end
