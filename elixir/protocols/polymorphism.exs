##
# Targets.
#
defmodule Kelvin do
  defstruct name: "Kelvin", degree: 0
end

defmodule Celsius do
  defstruct name: "Celsius", degree: 0
end

defmodule Fahrenheit do
  defstruct name: "Fahrenheit", degree: 0
end

##
# Implementation.
#
defprotocol Temperature do
  def convert(target)
end

defimpl Temperature, for: Kelvin do
  def convert(target) do
    %Celsius{degree: target.degree - 273.15}
  end
end

defimpl Temperature, for: Celsius do
  def convert(target) do
    %Celsius{degree: target.degree}
  end
end

defimpl Temperature, for: Fahrenheit do
  def convert(target) do
    %Celsius{degree: (target.degree - 32) * 5 / 9}
  end
end

##
# Example of usage.
#
defmodule Main do
  def run do
    %Kelvin{degree: 300} |> Temperature.convert() |> IO.inspect()
    %Celsius{degree: 24.5} |> Temperature.convert() |> IO.inspect()
    %Fahrenheit{degree: 45} |> Temperature.convert() |> IO.inspect()
  end
end

Main.run
# %Kelvin{degree: 300} => %Celsius{degree: 26.8, name: "Celsius"}
# %Celsius{degree: 24.5} => %Celsius{degree: 24.5, name: "Celsius"}
# %Fahrenheit{degree: 45} => %Celsius{degree: 7.22, name: "Celsius"}
