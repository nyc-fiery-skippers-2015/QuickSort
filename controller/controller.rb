require_relative '../models/card.rb'
require_relative '../models/deck.rb'
require_relative '../view/view.rb'
require_relative '../parser/parser.rb'
# require 'pry'
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
      until list_of_card_obj.list_of_cards.length == 0
      system 'clear'
        View.quiz_card(list_of_card_obj.list_of_cards[0])
        ans = View.input
        if list_of_card_obj.check_answer(ans)
          list_of_card_obj.right_answer
          View.correct
          sleep(2.0)
          View.continue
          answer = View.input
          if answer.include?('y')
            next
          else
            return
          end
        else
          list_of_card_obj.wrong_answer
          View.wrong
          View.quiz_card_name(list_of_card_obj.list_of_cards[0])
          sleep(2.0)
        end
        # binding.pry
      end
      View.quit
      View.end
    end

  end
end


Controller.new(Deck.new(Parser.parse('../flashcards.txt')))
