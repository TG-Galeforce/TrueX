require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = 'S5R1inzdabyQIqM6cJIbtvP5X'
  config.consumer_secret    = 'lDBuAlrwYtuU20tkTcIlfyTM7nVLsL1zezYse4Ez2VSRzicjhS'
  config.oauth_token        = 'S5R1inzdabyQIqM6cJIbtvP5X'
  config.oauth_token_secret = 'lDBuAlrwYtuU20tkTcIlfyTM7nVLsL1zezYse4Ez2VSRzicjhS'
  config.auth_method        = :oauth
end

# Use 'follow' to follow a group of user ids (integers, not screen names)
TweetStream::Client.new.follow(202759325) do |status|
  puts "#{status.text}"
end