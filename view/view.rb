class View
  def self.welcome
    puts "Hey lets review your flaschards"
  end
  def self.input
    input = gets.chomp
  end
  def self.correct
    puts "You got this right, next card!"
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
