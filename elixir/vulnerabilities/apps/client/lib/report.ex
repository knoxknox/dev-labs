defmodule Client.Report do
  def generate(%{} = fields) do
    fields
    |> build_elements()
    |> XmlBuilder.document()
    |> XmlBuilder.generate(format: :none)
  end

  defp build_element(tag, value) do
    XmlBuilder.element(tag, %{}, value)
  end

  defp build_elements(map) do
    Enum.map(map, fn {key, value} ->
      build_element(key, build_recursively(value))
    end)
  end

  defp build_recursively(value) do
    if is_map(value), do: build_elements(value), else: value
  end
end
