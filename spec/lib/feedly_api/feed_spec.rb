require 'spec_helper'

describe FeedlyApi::Feed do
  DEFAULT_ITEMS_SIZE = 20

  let(:auth_token) { ENV['FEEDLY_TOKEN']   || 'GREATE_AUTH_TOKEN' }
  let(:user_id)    { ENV['FEEDLY_USER_ID'] || '00000000-000-NOT-VALID-a29b6679bb3c' }
  let(:feed_id)    { 'feed/https://www.eff.org/rss/updates.xml' }
  let(:feed)       { FeedlyApi::Client.new(auth_token).feed(feed_id) }

  describe '#items' do
    it 'returns feed items' do
      expect(feed.items.size).to eq DEFAULT_ITEMS_SIZE
    end

    it 'returns certain amount of feed items' do
      items = feed.items(count: 2)
      expect(items.size).to eq 2
    end

    it 'returns feed items in certain order'
  end
end
