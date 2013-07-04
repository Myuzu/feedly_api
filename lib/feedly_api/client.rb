module FeedlyApi
  class Client
    def initialize(auth_token = nil)
      @auth_token = auth_token
    end

    def feed(feed_url)
      FeedlyApi::Feed.new feed_url
    end
  end
end
