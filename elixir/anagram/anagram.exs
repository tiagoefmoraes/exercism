defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, anagram_matcher(base))
  end

  defp anagram_matcher(base) do
    base_downcased = String.downcase(base)
    base_comparable = make_comparable(base_downcased)
    fn (candidate) ->
      candidate_downcased = String.downcase(candidate)
      base_downcased != candidate_downcased &&
      make_comparable(candidate_downcased) == base_comparable
    end
  end

  defp make_comparable(s) do
    s |> String.to_char_list |> Enum.sort
  end
end