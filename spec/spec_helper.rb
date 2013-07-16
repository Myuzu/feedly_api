require 'feedly_api'
require 'pry'

unless ENV['TRAVIS'].nil?
  require 'coveralls'
  Coveralls.wear!
end
