class Deck < ActiveRecord::Base

  # Ron validations
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :cards
  has_many :rounds

  #Rohan-Stats
  def get_percent_correct
  	((self.get_num_correct.to_f/self.get_num_guesses.to_f) * 100).round(2)
  end

  def get_num_correct
  	num_correct_guesses = 0
  	self.rounds.each do |round|
  		round.guesses.each do |guess|
  			if guess.correct == true
  				num_correct_guesses += 1
  			end
  		end
  	end
  	return num_correct_guesses
  end

  def get_num_guesses
  	num_total_guesses = 0
  	self.rounds.each do |round|
  		num_total_guesses += round.guesses.count
  	end
  	return num_total_guesses
  end



end
