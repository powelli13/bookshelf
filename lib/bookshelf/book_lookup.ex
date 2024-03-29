defmodule Bookshelf.BookLookup do
  @moduledoc """
  Looks up book information given search term,
  accepts either ISBN or Title.
  TODO make a book struct??
  Returns a [] struct containing the information or
  informs the caller of any errors that occurred during lookup.
  """
  @base "https://www.googleapis.com/books/v1/volumes"

  def lookup_by_title(title) do
    case HTTPoison.get(title_url(title)) do
      {:ok, %{status_code: 200, body: body}} ->
        # TODO update this to be a list
        get_first_volume_info(body)

      {:ok, %{status_code: 404}} ->
        "404 returned!"

      {:error, %{reason: reason}} ->
        "Error was returned!"
    end
  end

  def lookup_by_isbn(isbn) do
    case HTTPoison.get(isbn_url(isbn)) do
      {:ok, %{status_code: 200, body: body}} ->
        get_first_volume_info(body)

      {:ok, %{status_code: 404}} ->
        "404 returned!"

      {:error, %{reason: reason}} ->
        "Error was returned!"
    end
  end

  defp get_first_volume_info(body) do
    decoded = Poison.decode!(body)
    first_book = hd(decoded["items"])
    author = hd(first_book["volumeInfo"]["authors"])

    %{
      "title" => first_book["volumeInfo"]["title"],
      "author" => author,
      "description" => first_book["volumeInfo"]["description"]
    }
  end

  defp isbn_url(query) do
    "#{@base}?q=isbn:" <> URI.encode(query)
  end

  defp title_url(query) do
    "#{@base}?q=title:" <> URI.encode(query)
  end
end
