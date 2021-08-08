defmodule Bookshelf.IsbnLookup do
  @moduledoc """
  Looks up book information given the ISBN.
  Returns a [] struct containing the information or
  informs the caller of any errors that occurred during lookup.
  """
  def modify_message(message) do
    test_value = Application.fetch_env!(:bookshelf, :test_var)
    "Here is the original message:\n#{message}\nHere is the test env var:\n#{test_value}"
  end
end
