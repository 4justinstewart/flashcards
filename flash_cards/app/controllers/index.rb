enable :sessions

before '/*' do 
  current_user
  redirect '/' unless session[:user_id]
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/dashboard'
  else
    redirect '/'
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