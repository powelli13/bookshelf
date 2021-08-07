defmodule BookshelfWeb.LookupController do
  use BookshelfWeb, :controller

  def index(conn, _) do
    test_value = Application.fetch_env!(:bookshelf, :test_var)

    render(conn, "index.html", value: test_value)
  end
end
