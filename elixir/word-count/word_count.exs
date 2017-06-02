defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> remove_punctuation
    |> String.split
    |> Enum.reduce(%{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end

  defp remove_punctuation(string) do
    String.replace(string, ~r/[_,!&@$%^&:]/, " ")
  end
end