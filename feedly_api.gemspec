$LOAD_PATH << File.expand_path('lib', __dir__)
require 'feedly_api'

Gem::Specification.new do |s|
  s.name        = 'feedly_api'
  s.version     = FeedlyApi::VERSION
  s.authors     = ['Myuzu']
  s.homepage    = 'https://github.com/Myuzu/feedly_api'
  s.summary     = 'Ruby wrapper for Feedly API'
  s.description = 'Simpe unofficial Feedly API wrapper. No auth yet. Zero external dependencies.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.2.10'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
