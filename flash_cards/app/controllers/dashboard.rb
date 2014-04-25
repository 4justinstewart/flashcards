get '/dashboard' do #/decks

# LIST ALL DECKS erb :show_decks, give CRUD options and ability to access user stats
  erb :dashboard
end

get '/deck/new' do #/decks/new

# TAKE US TO A FORM TO CREATE A NEW DECK
  erb :new_deck
end

get '/start_game' do #decks/:id

# VIEW A DECK (ie. Start playing)
  erb :start_game
end

post '/deck/new' do #/decks
  # CREATE A DECK OBJ
  # CREATE MANY CARD OBJS

  redirect to '/dashboard'
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
