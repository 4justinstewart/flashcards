enable :sessions



get '/start_game' do  # VIEW A DECK (ie. Start playing)
  puts "these are params:"
  p params
  # @user = User.find(1)

                           #(session[:id]) # assuming a session[:id] is available
  if params.empty?
    @deck_obj = Deck.where(name: 'colors').first #(name: params[:name]) # assuming a 'name' attribute is passed in the form equal to name: value in the hash.
    @deck_of_cards = Card.where(deck_id: @deck_obj.id).shuffle!
    p @deck_of_cards
    @current_card = @deck_of_cards.pop

  else
    p @deck_of_cards
    @current_card = params[:cards].pop
    p @current_card
  end

  erb :start_game
end

# post '/submit_answer' do
#   p params
#   @cards = params[:cards]
#   @answer = params[:answer]
#   redirect to "/start_game", "#{@cards}"
# end
