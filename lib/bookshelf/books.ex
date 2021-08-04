defmodule Bookshelf.Books do
  alias Bookshelf.Repo
  alias Bookshelf.Models.Book

  def list_all_books() do
    Repo.all(Book)
  end

  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  def create_book(attrs \\ %{}) do
    %Book{}
    |> change_book(attrs)
    |> Repo.insert()
  end
end
