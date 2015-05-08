require_relative "../models/deck.rb"
require_relative "../models/card.rb"

describe Deck do
  # before(:each) do
    let(:a)  {Card.new(:question => "awesome", :answer => "boring")}
    let(:b)  {Card.new(:question => "hello", :answer => "goodbye", :correctness => true)}
    let(:c)  {Card.new(:question => "hello", :answer => "goodbye")}
    cards = [:a,:b,:c]
    let(:d) {Deck.new(cards)}
  # end
  describe "#initialize" do
    it "should read cards " do
      expect(d.list_of_cards).to eq(cards)
    end
  end
  # describe "#shuffle_deck" do
  #   it " should shuffle_deck" do
  #     expect(d.shuffle_deck).to eq()
  #   end
  # end
  describe "#draw_card" do
    it "should draw the first card" do
      expect(d.draw_card).to eq(:a)
    end
  end
  describe "#check_answer" do
    it "check_answer" do
      card = Card.new(:question => "awesome", :answer => "boring")
      deck = Deck.new([card])
      expect(deck.check_answer("hello")).to eq(false)
    end
  end
end
