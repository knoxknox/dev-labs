defmodule Events do
  defmodule Create, do: defstruct [:name]
  defmodule Balance, do: defstruct [:name]
  defmodule Register, do: defstruct [:name]
  defmodule Increment, do: defstruct [:name, :amount]
  defmodule Decrement, do: defstruct [:name, :amount]
end
