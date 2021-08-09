defmodule BookshelfWeb.LookupController do
  use BookshelfWeb, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end

  def modify_message(conn, %{"message" => message}) do
    modified = Bookshelf.IsbnLookup.modify_message(message)

    render(conn, "index.html", value: modified)
  end

  def lookup_book(conn, %{"isbn" => isbn}) do
    #TODO sanitize
    book = Bookshelf.IsbnLookup.lookup_title(isbn)

    render(conn, "index.html", value: book)
  end
end
