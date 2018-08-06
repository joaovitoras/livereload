defmodule LivereloadWeb.PageController do
  use LivereloadWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
