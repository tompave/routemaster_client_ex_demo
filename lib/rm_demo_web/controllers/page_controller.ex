defmodule RmDemoWeb.PageController do
  use RmDemoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
