module FeedlyApi
  module API

    def get_user_profile
      make_request('profile')
    end

    def get_feed_info(feed_id)
      feed_id = CGI.escape(feed_id)
      make_request("feeds/#{feed_id}")
    end

    def get_subscriptions
      make_request('subscriptions/')
    end

    def get_feed_contents(feed_id, args = {})
      feed_id = CGI.escape(feed_id)
      make_request("streams/#{feed_id}/contents", args)
    end

    def get_tag_contents(tag_id, args = {})
      tag = CGI.escape("user/#{user_id}/tag/#{tag_id}")
      make_request("streams/#{tag}/contents", args)
    end

    def get_category_contents(category_id, args = {})
      category = CGI.escape("user/#{user_id}/category/#{category_id}")
      make_request("/streams/#{category}/contents", args)
    end

    def get_markers
      make_request('markers/counts')
    end
  end
end
