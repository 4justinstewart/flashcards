enable :sessions

before '/dashboard' do 
  # redirect '/' unless session[:user_id]
  current_user 
  unless @user 
    redirect '/'
  end
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    session[:user_id] = @user.id
    return "pass" # pass
    # redirect '/dashboard'
  else
    return "fail" # fail
  end
end

post '/signup' do
  if params[:user][:password] == params[:verify_password]
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/dashboard'
    end
  else
    redirect '/'
  end
end

post '/signout' do 
  session[:user_id] = nil
  redirect '/'
end
