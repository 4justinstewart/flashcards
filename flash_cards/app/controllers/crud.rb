enable :sessions



get '/deck/new' do
  erb :new_deck
end

post '/deck/new' do
  @user = User.find(session[:user_id])
  @deck = Deck.create(name: params[:deck_name], user_id: @user.id)
  redirect to "/card/new/#{@deck.id}"
end




get '/card/new/:d_id' do
  @deck = Deck.find(params[:d_id])
  erb :new_card
end

post '/card/new/:d_id' do
  @deck = Deck.find(params[:d_id])
  @card = Card.create(question: params[:card_question], answer: params[:card_answer], deck_id: @deck.id)
  p @card.id
  redirect to "/card/new/#{@deck.id}"
end





get '/deck/update/:d_id' do #/decks/:id/edit
  @deck = Deck.find(params[:d_id])
  erb :update_deck
end

post '/deck/update/:d_id' do
  @deck = Deck.find(params[:d_id])
  @deck.update_attributes(name: params[:deck_name])
  redirect to "/deck/update/#{@deck.id}"
end


get '/card/update/:d_id' do #/decks/:id/edit
 puts "CARD UPDATE"
end

post '/card/update/:d_id' do

end





delete '/deck/delete/:d_id' do
  @deck = Deck.find(params[:d_id])
  # @deck.destroy
  redirect to '/decks'
end

post '/card/delete/:d_id/:c_id' do
  @deck = Deck.find(params[:d_id])
  @card = Card.find(params[:c_id])
  @card.destroy
  redirect to "/deck/update/#{@deck.id}"
end
