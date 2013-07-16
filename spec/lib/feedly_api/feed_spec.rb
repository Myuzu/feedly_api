require 'spec_helper'

describe FeedlyApi::Feed do
  let(:feed_data) { {website: 'https://www.eff.org/rss/updates.xml', subscribers: 2443,
    title: 'Deeplinks', velocity: 15.2,
    id: 'feed/https://www.eff.org/rss/updates.xml' }
  }
  let(:feed) { FeedlyApi::Feed.new(feed_data) }

  describe '#new' do
    it 'stores website' do
      expect(feed.website).to eq 'https://www.eff.org/rss/updates.xml'
    end

    it 'stores subscribers' do
      expect(feed.subscribers).to eq 2443
    end

    it 'stores title' do
      expect(feed.title).to eq 'Deeplinks'
    end

    it 'stores velocity' do
      expect(feed.velocity).to eq 15.2
    end

    it 'stores id' do
      expect(feed.id).to eq 'feed/https://www.eff.org/rss/updates.xml'
    end
  end

  describe '#items' do
    it 'returns feed items' do
      expect(feed.items.size).to eq 20
    end

    it 'returns certain amount of feed items'
    it 'returns feed items in certain order'
  end
end
