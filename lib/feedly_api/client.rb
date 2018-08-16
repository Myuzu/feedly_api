# frozen_string_literal: true

require 'feedly_api/api'

module FeedlyApi
  # Client
  class Client
    include API

    attr_reader :access_token

    def initialize(access_token = nil)
      @access_token = access_token
    end

    def feed(feed_id)
      Feed.new(self, feed_id)
    end

    private

    def make_request(path, argv = {})
      url = FeedlyApi::API_ENDPOINT + path + '?'
      argv.each do |k, v|
        url << "#{k}=#{v}&"
      end

      api_response = FeedlyApi.get(url, @auth_token)

      MultiJson.load(api_response, symbolize_keys: true)
    end
  end
end
