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

  def move_card
    if check_answer == true
      list_of_cards.shift
    else
      list_of_cards.rotate!
      # list_of_cards << list_of_cards.shift
    end
  end
end
