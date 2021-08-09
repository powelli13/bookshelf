defmodule Bookshelf.IsbnLookup do
  @moduledoc """
  Looks up book information given the ISBN.
  Returns a [] struct containing the information or
  informs the caller of any errors that occurred during lookup.
  """
  @base "https://www.googleapis.com/books/v1/volumes"
  
  def modify_message(message) do
    test_value = Application.fetch_env!(:bookshelf, :test_var)
    "Here is the original message:\n#{message}\nHere is the test env var:\n#{test_value}"
  end

  def lookup_title(isbn) do
    case HTTPoison.get(url(isbn)) do
      {:ok, %{status_code: 200, body: body}} ->
        get_first_volume_title(body)

      {:ok, %{status_code: 404}} ->
        "404 returned!"

      {:error, %{reason: reason}} ->
        "Error was returned!"
    end
  end

  defp get_first_volume_title(body) do
    decoded = Poison.decode!(body)
    IO.inspect decoded
    first_book = hd decoded["items"]
    IO.inspect first_book
    IO.inspect first_book["volumeInfo"]["title"]
  end

  defp url(query) do
    "#{@base}?q=isbn:" <> URI.encode(query)
  end
end
