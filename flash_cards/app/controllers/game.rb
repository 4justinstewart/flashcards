enable :sessions



get '/start_game/:deck_id' do  # VIEW A DECK (ie. Start playing)
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: session[:user_id], deck_id: @deck.id)
  @card = @round.pick_card
  erb :current_game
end

post '/current_game/:round_id/:card_id' do
  @round = Round.find(params[:round_id])
  @card = Card.find(params[:card_id])
  @guess = Guess.create(word: params[:response], correct: (params[:response] == @card.answer), round_id: @round.id, card_id: @card.id)
  redirect to "/current_game/#{@round.id}"
end

get '/current_game/:round_id' do
  @round = Round.find(params[:round_id])
  if @round.all_cards_played?
    puts "The game has ended."
    redirect to "/end_game/#{@round.id}"
  else
    @card = @round.pick_card
    erb :current_game
  end
end

get '/end_game/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(@round.deck_id)
  erb :end_game
end
