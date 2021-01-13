defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end

  test "save and load file" do
    deck = Cards.create_deck()
    Cards.save(deck, "test_deck")
    assert deck == Cards.load("test_deck")
  end

  test "updating values in a map" do
    colors = %{primary: "red", secondary: "blue"}
    colors1 = Map.put(colors, :primary, "yellow")
    colors2 = %{colors | primary: "yellow"}
    refute colors.primary === colors1.primary
    refute colors === colors2
    assert colors1 === colors2
  end

  test "lists and tuples" do
    colors = [{:primary, "red"}, {:secondary, "green"}]
    assert colors[:primary] == "red"
    colors_repeat = [primary: "red", primary: "red"]
    [{:primary, color} | _tail] = colors_repeat
    assert color == "red"
  end
end
