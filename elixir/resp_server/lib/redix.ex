##
# Usage:
# > RespServer.Redix.send(["TEST"])
# > RespServer.Redix.send(["TEST", 42])
#
defmodule RespServer.Redix do
  def send(command) do
    {:ok, connection} = redix_connect
    Redix.command(connection, command)
  end

  defp redix_connect do
    Redix.start_link("redis://localhost:3211")
  end
end
