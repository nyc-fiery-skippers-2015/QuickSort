require_relative '../models/card.rb'
module Parser
  def self.parse(filename)
    flashcard_arr = []
    File.open(filename) do |row|
      row.each_line.each_slice(4) do |question, answer, last_result, lifetime_wrong|
        flashcard_arr << Card.new({:question => question.delete("\n"), :answer => answer.delete("\n"), :last_result => last_result.delete("\n"), :lifetime_wrong => lifetime_wrong.delete("\n").to_i})
      end
    end
    flashcard_arr
  end

  def self.save(filename, list)
    # arr = Parser.parse('../flashcards.txt')
    File.open(filename, 'wb') do |file|
      list.each do |obj|
        file.write("#{obj.question}\n#{obj.answer}\n#{obj.last_result}\n#{obj.lifetime_wrong}\n")
      end
    end
  end

  def self.deck_save(filename, deck)
    File.open(filename, 'a+') do |file|
      file.write("#{deck.time}\n")
    end
  end

  def self.deck_parse(filename)
    deck_time_arr = []
    File.readlines(filename).map do |row|
      row.delete("\n")
    end
  end
end

