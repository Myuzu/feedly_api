# frozen_string_literal: true

require 'feedly_api'
require 'pry'

unless ENV['TRAVIS'].nil?
  require 'coveralls'
  Coveralls.wear!
end
