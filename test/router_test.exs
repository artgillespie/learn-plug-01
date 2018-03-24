defmodule Plug01.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Plug01.Router.init([])

  test "returns hello world" do
    conn = conn(:get, "/hello")
    conn = Plug01.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello, World!"
  end

  test "404" do
    conn = conn(:get, "/")
    conn = Plug01.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "oops"
  end

  test "static file" do
    conn = conn(:get, "/static/msg.txt")
    conn = Plug01.Router.call(conn, @opts)
    assert conn.state == :file
    assert conn.status == 200
    assert conn.resp_body == "Hello, Static File!\n"
  end

  test "path parms" do
    conn = conn(:get, "/user/jenn")
    conn = Plug01.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello, jenn!"
  end

  test "httpclient" do
    conn = conn(:get, "/httpclient")
    conn = Plug01.Router.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 200
  end
end
