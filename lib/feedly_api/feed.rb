module FeedlyApi
  class Feed
    attr_reader :website,
                :subscribers,
                :title,
                :velocity,
                :id

    def initialize(data)
      @website     = data.fetch(:website)
      @subscribers = data.fetch(:subscribers)
      @title       = data.fetch(:title)
      @velocity    = data.fetch(:velocity)
      @id          = data.fetch(:id)
    end

    def items
      []
    end
  end
end
