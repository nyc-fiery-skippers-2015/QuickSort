require_relative "../models/card.rb"

describe Card do
  let(:a)  {Card.new(:question => "awesome", :answer => "boring")}
  let(:c)  {Card.new(:question => "hello", :answer => "goodbye")}
  let(:b)  {Card.new(:question => "hello", :answer => "goodbye", :correctness => true)}

  describe "#attr_reader" do
    it "c.question should equal hello" do
      expect(c.question).to eql("hello")
    end
  end
  describe "#attr_reader" do
    it "c.answer should equal goodbye" do
      expect(c.answer).to eql("goodbye")
    end
  end
  describe "#attr_reader" do
    it "c.correctness should equal false" do
      expect(c.correctness).to eql(false)
    end
  end
  describe "#attr_reader" do
    it "b.correctness should equal true" do
      expect(b.correctness).to eql(true)
    end
  end
end
