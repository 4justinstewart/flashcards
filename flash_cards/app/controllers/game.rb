enable :sessions

get '/start_game' do #decks/:id

# VIEW A DECK (ie. Start playing)
  erb :start_game
end