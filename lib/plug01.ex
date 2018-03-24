defmodule Plug01 do
  import Plug.Conn
  
  @moduledoc """
  Documentation for Plug01.
  """

  def init(options) do
    options
  end

  @doc """
  Hello, Plug!
  """
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello, Plug!")
  end

end
