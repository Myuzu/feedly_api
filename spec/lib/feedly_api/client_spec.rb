require 'spec_helper'

describe FeedlyApi::Client do
  let(:auth_token) { ENV['FEEDLY_TOKEN']   || 'GREATE_AUTH_TOKEN' }
  let(:user_id)    { ENV['FEEDLY_USER_ID'] || '00000000-000-NOT-VALID-a29b6679bb3c' }
  let(:client)     { FeedlyApi::Client.new(auth_token) }
  let(:feed_data)  { {website: 'https://www.eff.org/rss/updates.xml', subscribers: 2443,
    title: 'Deeplinks', velocity: 15.2,
    id: 'feed/https://www.eff.org/rss/updates.xml' }
  }

  describe '#feed' do
    it 'returns Feed object with given feed_id' do
      feed = client.feed(feed_data[:id])
      expect(feed.id).to eq feed_data[:id]
    end
  end
end
