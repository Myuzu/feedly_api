module FeedlyApi
  module Api
    API_ENDPOINT = 'http://cloud.feedly.com/v3/'

    class << self
      def fetch(resource, id, params = {})
        params = params.map { |k,v| "#{k.to_s}=#{v.to_s}&" }.join
        
        url  = API_ENDPOINT
        url += resource.to_s
        url += '/'
        url += id
        url += '/contents' if :streams == resource
        url += "?ck=#{Time.now.to_i}000&"
        url += params

        JSON.parse(get(url), symbolize_names: true)
      end

      private

      def get(url)
        response = Net::HTTP.get_response(URI(url))
        raise Error unless 200 == response.code.to_i
        raise BadRequest if 'null' == response.body
        response.body
      end
    end
  end
end
