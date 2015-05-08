require_relative '../models/card.rb'
module Parser
  def self.parse(filename)
    flashcard_arr = []
    File.open(filename) do |row|
      row.each_line.each_slice(4) do |question, answer, last_result, lifetime_wrong|
        flashcard_arr << Card.new({:question => question.delete("\n"), :answer => answer.delete("\n"), :last_result => last_result, :lifetime_wrong => lifetime_wrong})
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
    # file.close
  end
end
# Parser.save("test.txt")
# p Parser.parse('test.txt')
