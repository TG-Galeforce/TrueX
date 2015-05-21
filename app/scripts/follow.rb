require 'rubygems'
require 'tweetstream'
require 'yajl'

TweetStream.configure do |config|
  config.consumer_key       = 'S5R1inzdabyQIqM6cJIbtvP5X'
  config.consumer_secret    = 'lDBuAlrwYtuU20tkTcIlfyTM7nVLsL1zezYse4Ez2VSRzicjhS'
  config.oauth_token        = '3219879810-SwTGjigK7UDaID2Hh4Gbl8Hw0ICwSE07Ucbsr5M'
  config.oauth_token_secret = 'fhmQjlgVqT0eEDCqdsemFQfVKNyhNj5vhx13LY19yBVHw'
  config.auth_method        = :oauth
	config.parser = :yajl
end

daemon = TweetStream::Daemon.new('follower')
daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
  ActiveRecord::Base.logger = Logger.new(File.open('log/stream.log', 'w+'))
end
#The below block never executes atm.
daemon.follow(202759325) do |tweet|
  Status.create_from_tweet(tweet)
  puts `echo "hiiiiiiii" > foo.txt`
end