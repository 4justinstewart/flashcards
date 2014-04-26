class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  belongs_to :deck


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


end
