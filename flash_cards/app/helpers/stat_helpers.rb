helpers do

def create_decks_stat_hash
	deck_stat_hash = {}
	Deck.all.each do |item|
		deck_stat_hash[item.name] = item.get_percent_correct
	end
	return deck_stat_hash
end

def create_deck_stat_by_round(user)
	new_hash = {}
	hash_round_stat = user.get_stat_rounds
	user.get_played_deck_ids.each do |deck_id|
		deck_obj = Deck.find(deck_id)
		deck_name = deck_obj.name
		new_hash[deck_name] = []
		hash_round_stat.each_pair do |key, value|
			if Round.find(key).deck.id == deck_id
				new_hash[deck_name] << value
			end
		end

	end


	# hash_round_stat = user.get_stat_rounds
	# hash_round_stat.each_pair do |key, value|
	# 	this = (Round.find(key)).deck.name
	# 	if n
	# 	new_hash[this] = value
	# end

	return new_hash



	# it is in this form

	# {"4"=>66.67, "5"=>66.67, "6"=>100.0, "7"=>100.0}


	# i want it in this form 

	# { "Pokemon" => [33, 44, 66], "Color" => [53, 23, 43]}

	#I want to grab the round id and use it to get => deck name; then i want to put the deck in a new hash
	#well first i can get all the ids of the decks that were played by a user (I have a method for this); and get get the put the names of those in a separate hash, and then i can iterate through the hash that I do have and I can get the value and push it to the array that I am interested in


end

def get_deck_names(hash)
	new_hash = {}
	hash.each_pair do |key, value|
		name = (Deck.find(key)).name
		new_hash[name] = value
	end
	return new_hash

end





end