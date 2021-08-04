defmodule Bookshelf.Models.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string

    timestamps()
  end

  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :isbn])
    |> validate_required([:title, :isbn])
  end
end
