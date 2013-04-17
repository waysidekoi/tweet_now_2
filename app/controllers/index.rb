get '/' do
  erb :index
end

get '/oauth' do
  @consumer = create_consumer
  session[:request_token] = @consumer.get_request_token(:oauth_callback => 'http://localhost:9393/auth')
  redirect session[:request_token].authorize_url
end

get '/auth' do

  @access_token = session[:request_token].get_access_token(oauth_verifier: params[:oauth_verifier])
  session.delete(:request_token) 

  # @user = User.create(username: @access_token.params[:screen_name], 
  #                     user_token: @access_token.token, 
  #                     user_secret: @access_token.secret)
  
  session[:user_token] = @access_token.token
  session[:user_secret] = @access_token.secret
  redirect '/tweet'
end

get '/tweet' do
  erb :logged_in
end

post '/tweet' do
  client.update(params[:tweet])
  erb :logged_in
end
