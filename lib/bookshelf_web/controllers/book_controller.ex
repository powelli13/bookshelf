defmodule BookshelfWeb.BookController do
  use BookshelfWeb, :controller

  alias Bookshelf.Books
  alias Bookshelf.Models.Book

  def index(conn, _params) do
    books = Books.list_all_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    book = Books.change_book(%Book{})
    render(conn, "new.html", changeset: book)
  end

  def create(conn, %{"book" => book_params}) do
    case Books.create_book(book_params) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Book created successfully!")
        |> redirect(to: Routes.book_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
