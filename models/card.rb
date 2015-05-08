class Card
  attr_reader :question, :answer, :last_result, :lifetime_wrong

  def initialize(args={})
    @question = args[:question]
    @answer = args[:answer]
    @last_result = args[:last_result] || false
    @lifetime_wrong = args[:lifetime_wrong] || 0
  end

  def got_wrong
    self.last_result = true
    self.lifetime_wrong += 1
  end
end
