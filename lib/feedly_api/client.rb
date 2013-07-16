require 'feedly_api/api'

module FeedlyApi
  class Client
    include API

    attr_reader :auth_token, :user_id

    def initialize(auth_token = nil)
      @auth_token = auth_token
      @user_id = get_user_profile[:id]
    end

    private

    def make_request(path, argv = {})
      url = FeedlyApi::API_ENDPOINT + path + '?'
      argv.each do |k,v|
        url << "#{k}=#{v}&"
      end
      # p url
      JSON.parse(FeedlyApi.get(url, @auth_token), symbolize_names: true)
    end
  end
end
