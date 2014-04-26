class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  belongs_to :deck

  def all_cards_played?
    pick_card == nil
  end

  def pick_card
    possible_cards_array = []
    self.deck.cards.each do |card_obj|
      if card_obj.guesses.where(round_id: self.id).empty?
        possible_cards_array << card_obj
      end
    end
    possible_cards_array.shuffle.pop
  end


end
