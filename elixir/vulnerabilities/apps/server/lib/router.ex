defmodule Router do
  use Plug.Router
  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  get "/health" do
    send_resp(conn, 200, encode("OK"))
  end

  post "/message" do
    {:ok, body, conn} = read_body(conn)
    response = decode(body) |> get_in(["message"])

    send_resp(conn, 201, encode(response))
  end

  match _ do
    send_resp(conn, 404, encode("Not Found"))
  end

  defp decode(body) do
    Poison.decode!(body)
  end

  defp encode(response) do
    Poison.encode!(%{response: response})
  end

  ##
  # @override
  # see Plug.ErrorHandler
  #
  def handle_errors(conn, _error) do
    response = "Error #{conn.status} happens"
    send_resp(conn, conn.status, encode(response))
  end

end
