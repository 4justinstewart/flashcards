enable :sessions

get '/start_game' do  # VIEW A DECK (ie. Start playing)
  @user = User.find(1)                         #(session[:id]) # assuming a session[:id] is available
  @deck_obj = Deck.where(name: 'colors').first #(name: params[:name]) # assuming a 'name' attribute is passed in the form equal to name: value in the hash.

  @deck_of_cards = Card.where(deck_id: @deck_obj.id)


  erb :start_game
end
