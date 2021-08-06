defmodule BookshelfWeb.BookControllerTest do
  use BookshelfWeb.ConnCase

  test "GET /books", %{conn: conn} do
    conn = get(conn, "/books")
    assert html_response(conn, 200) =~ "All Books"
  end
end
