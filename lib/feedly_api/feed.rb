module FeedlyApi
  class Feed
    attr_reader :url, :subscribers, :title, :velocity, :id

    def initialize(url)
      @url = url
      @id  = "feed%2F#{CGI.escape(@url)}"
      get_info
    end

    def get_info
      json = Api.fetch(:feeds, @id)
      @subscribers = json.fetch(:subscribers) { nil }
      @title       = json.fetch(:title) { nil }
      @velocity    = json.fetch(:velocity) { nil }
    end

    def items(params = {})
      Api.fetch(:streams, @id, params).fetch(:items)
    end
  end
end
