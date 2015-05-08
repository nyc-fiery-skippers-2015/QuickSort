# require_relative "../models/card.rb"
# require_relative "../parser/parser.rb"
class Deck
  attr_accessor :list_of_cards

  def initialize(list_of_cards)
    @list_of_cards = list_of_cards
    @word_arr = []
  end

  def filter(choice)
    if choice.to_i == 2
      list_of_cards.select!{|card| card.last_result == true}
    elsif choice.to_i == 3
      list_of_cards.sort_by!{|card| card.lifetime_wrong}.reverse!.shift(10)
    else
      return list_of_cards
    end
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

  def wrong_arr(card)
    @word_arr << "#{card.question}\n#{card.answer}"
  end
  def wrong_word_arr
    @word_arr
  end

  def wrong_answer
    list_of_cards.rotate!
  end
end

# test = Deck.new(Parser.parse('../flashcards.txt'))
# p test.filter(2)
