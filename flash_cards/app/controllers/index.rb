enable :sessions

before '/dashboard' do 
  current_user 
  unless @user 
    redirect '/'
  end
end

get '/' do
  erb :index
end

post '/login' do
  puts params[:email]
  puts params[:password]
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    session[:user_id] = @user.id
    return "pass" # pass
  else
    return "fail" # fail
  end
end

post '/signup' do
  # if params[:user][:password] == params[:verify_password]
  #   @user = User.new(params[:user])
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect '/dashboard'
  #   end
  # else
  #   redirect '/'
  # end
  p params
  if params[:user][:password] == params[:verify_password] && params[:user][:password] != ''
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      return "created"
    else
      return @user.errors.full_messages.to_json
    end
  elsif params[:user][:password] == ''
    return "blankpassword"
  else  
    return "nomatch"
  end
end

post '/signout' do 
  session[:user_id] = nil
  redirect '/'
end
