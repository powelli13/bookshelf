defmodule BookshelfWeb.PageController do
  use BookshelfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
