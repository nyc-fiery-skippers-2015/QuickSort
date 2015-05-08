require_relative '../models/card.rb'
require_relative '../models/deck.rb'
require_relative '../view/view.rb'
require_relative '../parser/parser.rb'

class Controller
  attr_accessor :list_of_card_obj
  def initialize(list_of_card_obj)
    @list_of_card_obj = list_of_card_obj
    run
  end

  def run
    View.rules
    View.welcome
    View.confirm
    input = View.input
    if input.include?('y')
      # until list_of_card_obj.length == 0
      system 'clear'
        View.quiz_card(list_of_card_obj.list_of_cards[0])
        ans = View.input
        if list_of_card_obj.check_answer(ans)
          View.correct
        else
          View.wrong
        end
      # end
    end

  end
end


Controller.new(Deck.new(Parser.parse('../flashcards.txt')))
