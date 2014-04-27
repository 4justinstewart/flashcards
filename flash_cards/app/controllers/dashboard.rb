enable :sessions

before '/dashboard' do
  current_user
  unless @user
    redirect '/'
  end
end

get '/dashboard' do #/decks
	# session

	@decks = Deck.all
	# @user = User.find_by_email(params[:email])
	@rounds = @user.rounds
# LIST ALL DECKS erb :show_decks, give CRUD options and ability to access user stats

	#Stats Stuff
	user = User.find(session[:user_id])
	@user_stats_by_deck = get_deck_names(user.get_stat_decks)
	@deck_stats_by_deck = create_decks_stat_hash




  erb :dashboard
end

