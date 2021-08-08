defmodule BookshelfWeb.LookupController do
  use BookshelfWeb, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end

  def modify_message(conn, %{"message" => message}) do
    modified = Bookshelf.IsbnLookup.modify_message(message)

    render(conn, "index.html", value: modified)
  end
end
