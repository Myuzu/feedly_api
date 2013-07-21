require 'spec_helper'

describe FeedlyApi::Client do
  let(:auth_token) { ENV['FEEDLY_TOKEN']   || 'GREATE_AUTH_TOKEN' }
  let(:user_id)    { ENV['FEEDLY_USER_ID'] || '00000000-000-NOT-VALID-a29b6679bb3c' }
  let(:client)     { FeedlyApi::Client.new auth_token }

  describe '#new' do
    before :each do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'profile.json')))
    end

    it 'creates Client object with given token' do
      client = FeedlyApi::Client.new auth_token
      expect(client.auth_token).to eq auth_token
    end

    it 'saves user_id' do
      expect(client.user_id).to eq user_id
    end
  end

  describe '#get_user_profile' do
    # rewrite for more accurancy
    it 'returns user info' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'profile.json')))
      expect(client.get_user_profile[:client]).to eq 'feedly'
    end
  end

  describe '#get_feed_info' do
    it 'retrievs basic feed info' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'feed_info.json')))
      feed_info = client.get_feed_info('feed/https://www.eff.org/rss/updates.xml')
      expect(feed_info[:website]).to eq 'https://www.eff.org/rss/updates.xml'
    end
  end

  describe '#get_subscriptions' do
    it 'retrievs user subscriptions' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'subscriptions.json')))
      expect(client.get_subscriptions.size).to eq 3
    end
  end

  describe '#get_feed_contents' do
    it 'retrievs feed contents' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'feed_contents_20.json')))
      feed_contents = client.get_feed_contents('feed/https://www.eff.org/rss/updates.xml')
      expect(feed_contents[:items].size).to eq 20
    end

    it 'retrievs custom number of feed items' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'feed_contents_10.json')))
      feed_contents = client.get_feed_contents('feed/https://www.eff.org/rss/updates.xml', {count: 10})
      expect(feed_contents[:items].size).to eq 10
    end

    it 'returns feed items in custom order'

    it 'returns unred only feed items'
  end

  describe '#get_tag_contents' do
    it 'retrievs content for specific tag' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'tagged.json')))
      feed_contents = client.get_tag_contents('global.saved')
      expect(feed_contents[:items].size).to eq 1
    end

    # Update fixture for more items with tags
    # it 'retrievs custom number of feed items for specific tag' do
    #   feed_contents = client.get_tag_contents('global.saved', {count: 10})
    #   expect(feed_contents[:items].size).to eq 10
    # end
  end

  describe '#get_category_contents' do
    it 'retrievs content for custom category_id' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'uncategoriezed.json')))
      feed_contents = client.get_category_contents('global.uncategorized')
      expect(feed_contents[:items].size).to eq 16
    end

    it 'retrievs custom number of feed items for specific category_id' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'uncategoriezed_10.json')))
      feed_contents = client.get_category_contents('global.uncategorized', {count: 10})
      expect(feed_contents[:items].size).to eq 10
    end
  end

  describe '#get_markers' do
    it 'returns unred counts for all feeds' do
      FeedlyApi.stub(:get).and_return(File.read(File.join('spec', 'fixtures', 'markers.json')))
      expect(client.get_markers[:unreadcounts].last[:count]).to eq 16
    end
  end
end
