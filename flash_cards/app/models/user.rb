class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds



  #Rohan - Stats

  def get_stat_decks
  	hash_stat_decks = {}

  	self.get_played_deck_ids.each do |deck_id|
  		hash_stat_decks["#{deck_id}"] = [0,0]
  	end
  	user_rounds = self.rounds
  	user_rounds.each do |round|
  		deck_id_of_round = round.deck.id
  		array_numguessescorrect_numguesses = hash_stat_decks["#{deck_id_of_round}"]
  		array_numguessescorrect_numguesses[0] = array_numguessescorrect_numguesses[0] + round.get_num_correct
  		array_numguessescorrect_numguesses[1] = array_numguessescorrect_numguesses[1] + round.get_num_guesses
  		hash_stat_decks["#{deck_id_of_round}"] = array_numguessescorrect_numguesses
  	end
  	if hash_stat_decks != nil
  		hash_stat_decks.each_pair do |key, array|
  		hash_stat_decks[key] = ((array[0].to_f/array[1].to_f) * 100).round(2)
  		end
  		return hash_stat_decks
  	else
  		return false
  	end
  end

  def get_stat_rounds
  	hash_stat_rounds = {}
  	self.rounds.each do |round|
  		hash_stat_rounds["#{round.id}"] = round.get_percent_correct 
  	end
  	return hash_stat_rounds
  end

  def get_played_deck_ids
  	array_played_deck_ids = []
  	self.rounds.each do |round|
  		array_played_deck_ids << round.deck_id 
  	end
  	return array_played_deck_ids.uniq
  end

end




