require_relative "../models/card.rb"
class Deck
  attr_accessor :list_of_cards

  def initialize(list_of_cards)
    @list_of_cards = list_of_cards
  end

  def shuffle_deck
    list_of_cards.shuffle!
  end

  def draw_card
    list_of_cards[0]
  end

  def check_answer(input)
    list_of_cards[0].answer == input
  end

  def right_answer
    list_of_cards.shift
  end

  def wrong_answer
    list_of_cards.rotate!
  end
end
