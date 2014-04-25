enable :sessions

get '/dashboard' do #/decks

# LIST ALL DECKS erb :show_decks, give CRUD options and ability to access user stats
  erb :dashboard
end

