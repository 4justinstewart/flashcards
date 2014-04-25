enable :sessions



get '/deck/new' do #/decks/new

# TAKE US TO A FORM TO CREATE A NEW DECK
  erb :new_deck
end

post '/deck/new' do
  #params[:deck_name]

  redirect to '/card/new'
end




get '/card/new' do
  erb :card
end

post '/card/new' do
  # CREATE A DECK OBJ
  # CREATE MANY CARD OBJS

  redirect to '/card/new'  #NEED DASHBOARD BUTTON
end





get '/deck/update' do #/decks/:id/edit

#take to erb: update_deck HTML form with prefilled card data
  erb :update_deck
end

patch '/deck/update' do
  #LOGIC of updating deck
  # use hidden input
  redirect to '/decks'
end


delete '/deck/delete' do
  # DESTROY DECK
  # use hidden input
  redirect to '/decks'
end
