get '/stats' do 

	user = User.find(session[:user_id])
	@stats_by_deck = get_deck_names(user.get_stat_decks)


	# puts "HERE IS SOME SHIT"
	# p create_deck_stat_by_round(user)
	# @stats_by_round = create_deck_stat_by_round(user)[0]




	@data = create_decks_stat_hash



	erb :stats
end