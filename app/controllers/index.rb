get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_account' do
  erb :create_account
end

post '/create_account' do

  @user = User.create(username: params[:username],
    email: params[:email],
    password: params[:password])

  session[:id] = @user.id

  redirect "/profile"

end


post '/login' do
  email     = params[:email]
  password  = params[:password]
  @user      = User.authenticate(email, password)

  if @user
    session[:id] = @user.id
    redirect "/profile"
  else
    erb :index
  end

end

get '/logout' do
  session.clear
  erb :index
end




