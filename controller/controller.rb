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

  def controller_got_right
    list_of_card_obj.list_of_cards[0].got_right!
    list_of_card_obj.right_answer!
    Parser.save('control_test.txt', list_of_card_obj.list_of_cards)
    View.correct
  end

  def controller_got_wrong
    View.wrong
    View.quiz_card_name(list_of_card_obj.list_of_cards[0])
    list_of_card_obj.wrong_arr!(list_of_card_obj.list_of_cards[0].dup)
    list_of_card_obj.wrong_answer!
    list_of_card_obj.list_of_cards[0].got_wrong!
    Parser.save('control_test.txt', list_of_card_obj.list_of_cards)
  end

  def continue
    sleep(1.5)
    View.continue
    answer = View.input
    if answer.include?('y')
      false
    else
      true
    end
  end

  def intro_screen
    View.rules
    View.welcome
    View.confirm
  end

  def end_of_game(arg)
    system 'clear'
    if arg.include?("y")
      View.wrong_answers(list_of_card_obj)
    end
      View.quit
      View.end
  end

  def select_deck
    View.deck_select
    answer = View.input
    list_of_card_obj.filter!(answer)
  end

  def run
    intro_screen
    input = View.input
    if input.include?('y')
      select_deck
      list_of_card_obj.list_of_cards.length.times do
      system 'clear'
      View.quiz_card(list_of_card_obj.list_of_cards[0])
      ans = View.input
      if list_of_card_obj.check_answer(ans)
        controller_got_right
        break if continue
      else
        controller_got_wrong
        break if continue
      end
    end
      View.review
      aaa = View.input
      end_of_game(aaa)
    end

  end
end


Controller.new(Deck.new(Parser.parse('control_test.txt')))
