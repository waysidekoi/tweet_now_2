helpers do
  def create_consumer
    OAuth::Consumer.new(ENV['CONSUMER_KEY'], 
      ENV['CONSUMER_SECRET'], 
      site: "http://api.twitter.com")
  end

  
  def client
    Twitter::Client.new(
      :consumer_key => ENV['CONSUMER_KEY'],
      :consumer_secret => ENV['CONSUMER_SECRET'],
      :oauth_token => session[:user_token],
      :oauth_token_secret => session[:user_secret]
      )
  end
end
