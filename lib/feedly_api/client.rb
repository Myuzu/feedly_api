require 'feedly_api/api'

module FeedlyApi
  class Client
    include API

    attr_reader :auth_token

    def initialize(auth_token = nil)
      @auth_token = auth_token
    end

    def user_id
      get_user_profile[:id]
    end

    def feed(feed_id)
      data = get_feed_info(feed_id)
      FeedlyApi::Feed.new data
    end

    private

    def make_request(path, argv = {})
      url = FeedlyApi::API_ENDPOINT + path + '?'
      argv.each do |k, v|
        url << "#{k}=#{v}&"
      end
      # p url
      JSON.parse(FeedlyApi.get(url, @auth_token), symbolize_names: true)
    end
  end
end
