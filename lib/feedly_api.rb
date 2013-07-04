module FeedlyApi

  class Client
    API_ENDPOINT = 'http://cloud.feedly.com/v3/streams/feed%2F'

    attr_reader :url

    def initialize url
      @url = url
    end

    def items(options = {})
      json = JSON.parse(get(construct_url(options)), symbolize_names: true)
      json[:items]
    end

    private

    def construct_url(options)
      params = options.map { |k,v| "#{k.to_s}=#{v.to_s}&" }.join
      url  = API_ENDPOINT
      url += CGI.escape(@url)
      url += '/contents?'
      url += params
    end

    def get(url)
      response = Net::HTTP.get_response(URI(url))
      raise unless 200 == response.code.to_i
      response.body
    end
  end

  require 'cgi'
  require 'net/http'
  require 'json'
end
