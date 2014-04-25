enable :sessions

get '/dashboard' do #/decks
	# session

	# @decks = Deck.all
	# @user = User.find_by_email(params[:email])
	# @rounds = 
# LIST ALL DECKS erb :show_decks, give CRUD options and ability to access user stats
  erb :dashboard
end

