require 'twitter'
require 'net/http'
require 'json'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def init_client
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key       = 'S5R1inzdabyQIqM6cJIbtvP5X'
		  config.consumer_secret    = 'lDBuAlrwYtuU20tkTcIlfyTM7nVLsL1zezYse4Ez2VSRzicjhS'
		  config.access_token        = '3219879810-SwTGjigK7UDaID2Hh4Gbl8Hw0ICwSE07Ucbsr5M'
		  config.access_token_secret = 'fhmQjlgVqT0eEDCqdsemFQfVKNyhNj5vhx13LY19yBVHw'
	  end
	  return client
	end

	def get_timeline(client)
		timeline = client.user_timeline(202759325)
		return timeline		
	end

  def hello
		client = init_client
		timeline = get_timeline(client)
		for tweet in timeline
			puts tweet.text
		end
		@tweets = timeline

    render template: "application/index"
  end

end