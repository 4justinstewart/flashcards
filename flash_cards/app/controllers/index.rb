enable :sessions

get '/' do
  # Look in app/views/index.erb
  # session[:user_id] = 1
  erb :index
end
