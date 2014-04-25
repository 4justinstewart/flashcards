enable :sessions

get '/deck/new' do #/decks/new

# TAKE US TO A FORM TO CREATE A NEW DECK
  erb :new_deck
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
