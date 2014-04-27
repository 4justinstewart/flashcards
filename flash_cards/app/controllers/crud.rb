enable :sessions

get '/my_decks' do
  @my_decks = Deck.where(user_id: session[:user_id])
  p @my_decks
  erb :my_deck_index
end


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

get '/card/update/:d_id/:c_id' do #/decks/:id/edit
  @card = Card.find(params[:c_id])
  @deck = Deck.find(params[:d_id])
  erb :update_deck
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


patch '/card/update' do
  puts "Do I get here?"
  p params
  @card_to_update = Card.find(params[:card_id])
  @card_to_update.update_attributes(params[:card])

  redirect to "/deck/update/#{@card_to_update.deck.id}"
end


delete '/deck/delete/:d_id' do
  @deck = Deck.find(params[:d_id])
  @deck.destroy
  redirect to '/my_decks'
end

post '/card/delete/:d_id/:c_id' do
  @deck = Deck.find(params[:d_id])
  @card = Card.find(params[:c_id])
  @card.destroy
  redirect to "/deck/update/#{@deck.id}"
end
