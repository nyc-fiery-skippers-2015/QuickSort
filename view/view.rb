class View

  def self.rules
    system 'clear'
    puts '*' * 85
    puts 'This is your flash-card game. You have one shot(one oppurtunity) to answer each card.'
    puts '*' * 85
  end

  def self.confirm
    puts 'Are you ready to play?'
  end
  def self.welcome
    puts "So lets review your flaschards"
  end

  def self.quiz_card(card)
    puts "What is:"
    puts "#{card.question}"
    puts "Please type your answer"
  end

  def self.quiz_card_name(card)
    puts "#{card.answer}"
  end

  def continue
    puts "Would you like to continue to the next card?"
  end

  def self.input
    gets.chomp
  end
  def self.correct
    puts "You got this right!"
  end
  def self.wrong
    puts "You got this wrong, here is the answer."
  end
  def self.quit
    puts "Okay we are done"
  end
  def self.end
    puts "You've completed all the cards"
  end
end
