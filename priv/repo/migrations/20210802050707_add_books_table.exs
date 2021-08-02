defmodule Bookshelf.Repo.Migrations.AddBooksTable do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :isbn, :string

      timestamps()
    end
  end
end
