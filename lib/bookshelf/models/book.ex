defmodule Bookshelf.Models.Book do
  use Ecto.Schema

  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string
  end
end