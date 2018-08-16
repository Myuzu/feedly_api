# frozen_string_literal: true

module FeedlyApi
  # Feed
  class Feed
    attr_reader :website,
                :subscribers,
                :title,
                :velocity,
                :id,
                :client

    def initialize(client = Client.new, feed_id)
      @client = client
      @id = feed_id

      fetch_feed_info
    end

    def items(args = {})
      @client.get_feed_contents(@id, args).fetch(:items) {[]}
    end

    private

    def fetch_feed_info
      data = @client.get_feed_info(@id)

      @website     = data.fetch(:website)     { nil }
      @subscribers = data.fetch(:subscribers) { nil }
      @title       = data.fetch(:title)       { nil }
      @velocity    = data.fetch(:velocity)    { nil }
    end
  end
end
