get '/profile' do
  if logged_in?
    erb :profile
  else
    redirect '/'
  end

end

get '/post/create' do
  if logged_in?
    erb :create_post
  else
    redirect '/'
  end
end

post '/post' do
  if logged_in?
    post = Post.create(title: params[:title],
                       text: params[:text],
                       user: current_user)
    redirect "/#{post.user.username}/#{post.id}"
  else
    redirect '/'
  end
end

get '/:current_user_name/:post_id' do
  @user = User.find_by_username(params[:current_user_name])
  array = @user.posts
  index = (params[:post_id].to_i - 1)
  @post = array[index]

  if @post.user.username == params[:current_user_name]
    erb :post
  else
    redirect "/#{@post.user.username}/#{@post.id}"
  end

end

get '/:username' do
  @user = User.find_by_username(params[:username])
  if logged_in?
    if @user == nil
      404
    else
      erb :profile
    end
  else
    erb :profile
  end

end


