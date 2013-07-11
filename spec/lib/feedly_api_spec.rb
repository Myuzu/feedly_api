require 'spec_helper'

describe FeedlyApi::Client do
  describe '#feed' do
    it 'creates Feed object for given url' do
      client = FeedlyApi::Client.new.feed 'https://www.eff.org/rss/updates.xml'
      expect(client.url).to eq 'https://www.eff.org/rss/updates.xml'
    end
  end
end

describe FeedlyApi::Feed do

  describe '#new' do
    context 'valid url' do
      let(:feed) { FeedlyApi::Feed.new 'https://www.eff.org/rss/updates.xml' }

      it 'has url' do
        expect(feed.url).to eq 'https://www.eff.org/rss/updates.xml'
      end

      it 'has id' do
        expect(feed.id).to eq 'feed%2Fhttps%3A%2F%2Fwww.eff.org%2Frss%2Fupdates.xml'
      end
    end

    context 'invalid url' do
      it 'fails with exception' do
        expect {
          FeedlyApi::Feed.new 'https://www.eff.org/rss/updates.xml12'
        }.to raise_error
      end
    end
  end

  describe '#items' do
    let(:feed) { FeedlyApi::Feed.new 'https://www.eff.org/rss/updates.xml' }

    context 'valid params' do
      it 'returns 20 feed items by default' do
        expect(feed.items.length).to eq 20
      end

      it 'takes :count param to get more or less feed items' do
        expect(feed.items(count: 2).length).to eq 2
      end

      it 'takes :ranked param with value "oldest" and returns oldest items first' do
        items = feed.items(ranked: 'oldest')
        expect(items.first[:published] < items.last[:published]).to be_true
      end
    end

    context 'not valid params' do
      it 'returns oldest first if :ranked params is other then "newest"' do
        items = feed.items(ranked: 'NOT_VALID_VALUE')
        expect(items.first[:published] < items.last[:published]).to be_true
      end

      it 'returns 0 items for negative :count param' do
        expect(feed.items(count: -50).length).to eq 0
      end

      it 'return defaul count of items (20) for non integer value' do
        expect(feed.items(count: 'NOT_AN_INTEGER').length).to eq 20
      end
    end
  end
end
