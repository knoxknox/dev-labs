defmodule Crawler.TasksCounter do
  use Agent
  @name __MODULE__

  def init do
    Agent.start_link(fn -> 0 end, name: @name)
  end

  def value do
    Agent.get(@name, & &1)
  end

  def reset do
    Agent.update(@name, fn _state -> 0 end)
  end

  def increment(value) do
    Agent.update(@name, fn state -> state + value end)
  end
end
