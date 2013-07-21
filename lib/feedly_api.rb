# encoding: utf-8

require 'feedly_api/version'
require 'feedly_api/errors'
require 'feedly_api/client'
require 'feedly_api/feed'

module FeedlyApi
  # A Ruby client library for Feedly Reader

  API_ENDPOINT = 'http://cloud.feedly.com/v3/'.freeze

  class << self
    def get(url, token)
      uri = URI(url)
      req = Net::HTTP::Get.new(uri.request_uri)

      unless token.nil?
        req['$Authorization.feedly'] = '$FeedlyAuth'
        req['Authorization'] = "OAuth #{token}"
      end

      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end

      handle_errors(response)
    end

    def handle_errors(response)
      raise BadRequest if 'null' == response.body

      case response.code.to_i
      when 200 then response.body
      when 401 then raise AuthError
      when 403 then raise AuthError
      when 404 then raise NotFound
      when 500 then raise Error
      else
        raise Error
      end
    end
  end

  require 'cgi'
  require 'net/http'
  require 'json'
  require 'date'
end
