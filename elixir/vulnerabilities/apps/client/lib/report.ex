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
      build_element(key, build_map_or_value(value))
    end)
  end

  defp build_map_or_value(value) do
    if is_map(value), do: build_elements(value), else: build_list_or_value(value)
  end

  defp build_list_or_value(value) do
    if is_list(value), do: Enum.map(value, &build_element(:value, &1)), else: value
  end
end
