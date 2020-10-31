defmodule Server.Params.Schema do
  def load(name) do
    schema_path(name) |> File.read!() |> Jason.decode!()
  end

  defp schema_path(name) do
    Application.app_dir(:server, "priv/params/#{name}.json")
  end
end
