defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearths", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle a deck of playing cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck
    The `hand_size`argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save a binaries file with the representation of the deck.
  """
  def save(deck, filename) do
    path = "./cards"

    if !File.exists?(path) do
      File.mkdir("#{path}")
    end

    binary = :erlang.term_to_binary(deck)
    File.write("./cards/#{filename}", binary)
  end

  @doc """
    Load a binaries file with the representation of the deck.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Returns a hand of size specified and a
    deck of playing cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end

# cards = Cards.create_deck()
# deck = Cards.shuffle(cards)
# hands = Cards.deal(deck, 5)
# Cards.save(deck, "my_deck")
# Cards.load("my_deck")
# Cards.create_hand(5)

# colors = %{primary: "red", secondary: "blue"}
# Map.put(colors, :primary, "blue")
# %{colors | primary: "yellow"}
