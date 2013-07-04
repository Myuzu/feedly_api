module FeedlyApi
  VERSION = '0.2b'
  API_ENDPOINT = 'http://cloud.feedly.com/v3/'

  class Feed
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def items(params = {})
      json = JSON.parse(get(construct_url(params)), symbolize_names: true)
      json[:items]
    end

    private

    def construct_url(options)
      params = options.map { |k,v| "#{k.to_s}=#{v.to_s}&" }.join
      url  = FeedlyApi::API_ENDPOINT
      url += 'streams/feed%2F'
      url += CGI.escape(@url)
      url += '/contents?'
      url += "ck=#{Time.now.to_i}000&"
      url += params
    end

    def get(url)
      response = Net::HTTP.get_response(URI(url))
      raise unless 200 == response.code.to_i
      response.body
    end
  end

  class Client
    def initialize(auth_token = nil)
      @auth_token = auth_token
    end

    def feed(feed_url)
      FeedlyApi::Feed.new feed_url
    end
  end

  require 'cgi'
  require 'net/http'
  require 'json'
end
