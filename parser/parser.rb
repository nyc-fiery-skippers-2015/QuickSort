require_relative '../models/card.rb'
module Parser
  def self.parse(filename)
    flashcard_arr = []
    File.open(filename) do |row|
      row.each_line.each_slice(3) do |question, answer, correct_state|
        flashcard_arr << Card.new({:question => question.delete("\n"), :answer => answer.delete("\n"), :correctness => correct_state})
      end
    end
    flashcard_arr
  end
end

# p Parser.parse('../flashcards.txt').length
