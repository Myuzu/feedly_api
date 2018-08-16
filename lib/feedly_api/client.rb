# frozen_string_literal: true

require 'feedly_api/api'

module FeedlyApi
  # Client
  class Client
    include API

    attr_reader :auth_token

    def initialize(auth_token = nil)
      @auth_token = auth_token
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

      JSON.parse(api_response, symbolize_names: true)
    end
  end
end
