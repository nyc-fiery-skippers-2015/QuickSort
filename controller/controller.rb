require_relative '../models/card.rb'
require_relative '../models/deck.rb'
require_relative '../view/view.rb'
require_relative '../parser/parser.rb'
require 'pry'
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
      # View.deck_select
      # answer = View.input
      # list_of_card_obj.filter(answer)
      until list_of_card_obj.list_of_cards.length == 0
      system 'clear'
        View.quiz_card(list_of_card_obj.list_of_cards[0])
        ans = View.input
        if list_of_card_obj.check_answer(ans)
          list_of_card_obj.right_answer
          View.correct
          sleep(1.5)
          View.continue
          answer = View.input
          if answer.include?('y')
            next
          else
            return
          end
        else
          View.wrong
          View.quiz_card_name(list_of_card_obj.list_of_cards[0])
          list_of_card_obj.wrong_arr(list_of_card_obj.list_of_cards[0].dup)
          list_of_card_obj.wrong_answer
          # list_of_card_obj.list_of_cards[0].got_wrong
          # Parser.save('control_test.txt', list_of_card_obj.list_of_cards)
          # binding.pry
          sleep(1.5)
          View.continue
          answer = View.input
          if answer.include?('y')
            next
          else
            return
          end
        end
        # binding.pry
      end
      View.review
      aaa = View.input
      if aaa.include?("y")
        View.wrong_answers(list_of_card_obj)
      end
        View.quit
        View.end
    end

  end
end


Controller.new(Deck.new(Parser.parse('control_test.txt')))
