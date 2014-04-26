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
  # p @user = User.authenticate(params[:email], params[:password])
  @user = User.authenticate(params[:email], params[:password])
  # if @user
  #   session[:user_id] = @user.id
  #   redirect '/dashboard'
  # end

  # ajax checks the login
  p @user
  if @user 
    session[:user_id] = @user.id
    puts "\n \n \n !!!!!!!!!USER PASSES LOGIN!!!!!!!!!"
    # return "pass"
    redirect '/dashboard'
  else
    puts "\n \n \n !!!!!USER SUCKS AND FAILS TO LOGIN!!!!!!"
    return fail
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

get '/signout' do 
  session[:user_id] = nil
  redirect '/'
end
