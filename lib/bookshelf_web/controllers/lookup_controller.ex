defmodule BookshelfWeb.LookupController do
  use BookshelfWeb, :controller

  def index(conn, _) do
    test_value = Application.fetch_env!(:bookshelf, :test_var)

    render(conn, "index.html", value: test_value)
  end

  def modify_message(conn, %{"message" => message}) do
    modified = Bookshelf.IsbnLookup.modify_message(message)

    render(conn, "index.html", value: modified)
  end
end
