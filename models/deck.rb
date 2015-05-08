class Deck
  attr_reader :list_of_cards

  def initialize(list_of_cards)
    @list_of_cards = list_of_cards
  end

  def shuffle_deck
    list_of_cards.shuffle
  end

  def draw_card
    list_of_cards[0]
  end

  def check_answer(input)
    # "What is the answer?"
    # input = gets.chomp
    if list_of_cards[0].answer == input
      "Correct!"
      return true
    else
      "Nope, we'll try this again later, dipshit"
      return false
  end

  def move_card
    if check_answer == true
      "Correct! You're so smart!"
      list_of_cards.shift
    else
      "Sorry, dipshit, that's not right!"
      list_of_cards << list_of_cards.shift
  end
end
