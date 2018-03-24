defmodule Plug01.Router do
  use Plug.Router

  plug Plug.Logger
  plug Plug.Static, at: "/static", from: { :plug01, "priv/app/static"}
  plug :match
  plug :dispatch

  if Mix.env == :dev do
    use Plug.Debugger
  end

  get "/hello" do
    send_resp(conn, 200, "Hello, World!")
  end

  get "/user/:name" do
    send_resp(conn, 200, "Hello, #{name}!")
  end

  get "httpclient" do
    # example of doing http client stuff to another service
    case HTTPoison.get "https://httpbin.org/get", ["X-App": "Streamer"] do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, body)
      {_, %HTTPoison.Response{body: body}} ->
        send_resp(conn, 200, body)
      {:error, %HTTPoison.Response{body: body}} ->
        send_resp(conn, 200, body)
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end


