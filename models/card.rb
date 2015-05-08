class Card
  attr_reader :question, :answer, :correctness

  def initialize(args={})
    @question = args[:question]
    @answer = args[:answer]
    @correctness = args[:correctness] || false
  end


end
