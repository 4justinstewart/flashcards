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
#Rohan - stats

  def get_num_guesses
  	self.guesses.count
  end

  def get_num_correct
  	num_correct = 0
  	self.guesses.each do |guess|
  		if guess.correct == true
  			num_correct += 1
  		end
  	end
  	return num_correct
  end

  def get_percent_correct
  	((self.get_num_correct.to_f/self.get_num_guesses.to_f) * 100).round(2)
  end

  def total_cards
    self.deck.cards.length
  end

  def last_question_status
    return "correct!" if self.guesses.last.correct == true
    return "wrong." if self.guesses.last.correct == false
  end
end
