defmodule BookshelfWeb.LookupController do
  use BookshelfWeb, :controller

  def index(conn, _) do
    render(conn, "index.html", value: %{})
  end

  def lookup_book(conn, %{"query" => query, "query_type" => query_type}) do
    # TODO sanitize
    book =
      case query_type do
        "Title" ->
          Bookshelf.BookLookup.lookup_by_title(query)

        "ISBN" ->
          Bookshelf.BookLookup.lookup_by_isbn(query)
      end

    render(conn, "index.html", value: book)
  end
end
