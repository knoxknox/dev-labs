defmodule RespServer.Conn do
  require Logger

  def accept(port) do
    {:ok, socket} = listen(port)
    Logger.info("Listen on #{port}")

    accept_next_connection_in_loop(socket)
  end

  defp accept_next_connection_in_loop(socket) do
    assign_tcp_controlling_process(socket)
    accept_next_connection_in_loop(socket)
  end

  defp assign_tcp_controlling_process(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    {:ok, task_id} = accept_new_client(client)

    :ok = :gen_tcp.controlling_process(client, task_id)
  end

  defp accept_new_client(client) do
    Task.start(fn -> serve(client, %{continuation: nil}) end)
  end

  defp listen(port) do
    :gen_tcp.listen(port, [:binary, active: false, reuseaddr: true])
  end

  defp serve(socket, %{continuation: nil}) do
    case :gen_tcp.recv(socket, 0) do
      {:error, :closed} -> :ok
      {:ok, data} -> parse(socket, Redix.Protocol.parse(data))
    end
  end

  defp serve(socket, %{continuation: fun}) do
    case :gen_tcp.recv(socket, 0) do
      {:error, :closed} -> :ok
      {:ok, data} -> parse(socket, fun.(data)) # next chunk of data
    end
  end

  defp parse(socket, {:continuation, fun}) do
    serve(socket, %{continuation: fun})
  end

  defp parse(socket, {:ok, request, leftover}) do
    response = request
    :gen_tcp.send(socket, Redix.Protocol.pack(response))

    case leftover do
      "" -> serve(socket, %{continuation: nil})
      _data -> parse(socket, Redix.Protocol.parse(leftover))
    end
  end
end
