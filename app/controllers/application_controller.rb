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

	def get_timeline(client, user_id)
		timeline = client.user_timeline(user_id)
		return timeline		
	end

	def user_tweets
		user_id = 202759325
		if params[:uid]
			user_id = params[:uid].to_i
		end

		client = init_client
		timeline = get_timeline(client, user_id)
		timeline_processed = []
		for tweet in timeline
			u_mentions = tweet.user_mentions

			tweet_processed = {}
			tweet_text = tweet.text

			text_split = []
			last_ind = 0
			for m in u_mentions
				inds = m.indices
				w1 = tweet_text[last_ind..inds[0]-1]
				w2 = '<a href="/users/' + m.id.to_s + '">' + tweet_text[inds[0]..inds[1]-1] + '</a>' #The name
				text_split.append(w1)
				text_split.append(w2)
				last_ind = inds[1]
			end
			wlast = tweet_text[last_ind..-1]
			text_split.append(wlast)

			text_processed = text_split.join

			tweet_processed['text'] = text_processed
			tweet_processed['created_at'] = tweet.created_at;
			timeline_processed.append(tweet_processed)
		end

		@tweets = timeline_processed
		@uid = user_id
    render template: "application/index"
	end

  def hello
  	user_tweets
  end

end