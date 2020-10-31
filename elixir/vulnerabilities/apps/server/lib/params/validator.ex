##
# Validates input parameters based on JSON schema:
# http://json-schema.org/draft-04/json-schema-validation.html
#
defmodule Server.Params.Validator do
  alias Server.Params.Schema, as: Schema
  @schema Schema.load(:schema) |> ExJsonSchema.Schema.resolve()

  def call(params) do
    case validate(params) do
      :ok -> {:ok, params}
      {:error, errors} -> {:error, errors}
    end
  end

  # @override
  def format(errors) do
    Enum.map(errors, &"#{&1.path}: #{to_string(&1.error)}")
  end

  defp validate(params) do
    ExJsonSchema.Validator.validate(@schema, params, error_formatter: __MODULE__)
  end
end
