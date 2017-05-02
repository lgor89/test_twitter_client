class TwitterApi
  def self.all_tweets
    client.user_timeline("IgorPenkovsky")
  end
  def self.send_tweet(message,image)
    client.update_with_media(message, File.new(image))
  end
  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        =  Rails.application.secrets.twitter_api_key
      config.consumer_secret     =  Rails.application.secrets.twitter_api_secret
      config.access_token        = Rails.application.secrets.twitter_api_token
      config.access_token_secret = Rails.application.secrets.twitter_api_token_secret
    end
  end
end