defmodule Plug01.Router do
  use Plug.Router

  plug Plug.Logger
  plug Plug.Static, at: "/static", from: { :plug01, "priv/app/static"}
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "Hello, World!")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end


