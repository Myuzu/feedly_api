feedly_api
==========
[![Coverage Status](https://img.shields.io/coveralls/Myuzu/feedly_api.svg)](https://coveralls.io/r/Myuzu/feedly_api?branch=master) [![Build Status](https://api.travis-ci.org/Myuzu/feedly_api.svg)](https://travis-ci.org/Myuzu/feedly_api) [![Code Climate](https://codeclimate.com/github/Myuzu/feedly_api/badges/gpa.svg)](https://codeclimate.com/github/Myuzu/feedly_api) [![Dependency Status](https://gemnasium.com/Myuzu/feedly_api.png)](https://gemnasium.com/Myuzu/feedly_api) [![Gem Version](https://badge.fury.io/rb/feedly_api.svg)](http://badge.fury.io/rb/feedly_api)

Early unofficial Feedly API with no external dependencies

## Limitations
* no auth for now
* get methods only
* continuation not implemented

## Usage

```ruby
# Create client for API requests; OAuth token optional
@client = FeedlyApi::Client.new
# Create Feed object for specific feed id
@feed = @client.feed('feed/https://www.eff.org/rss/updates.xml')
# Get array of feed items hashes
@feed.items
# Pass params to get more or less items
@feed.items(count: 50)
```

## Roadmap
- [ ] OAuth support
- [ ] Continuation
- [ ] OPML API
- [ ] Markers API
- [ ] Feeds API
- [ ] Entries API
- [ ] Categories API
- [ ] Subscriptions API
- [ ] Preferences API
- [ ] Profile API
- [ ] Topics API
- [ ] Tags API
- [ ] Search API
- [ ] URL Shortener API
- [ ] Mixes API

## Supported Ruby Versions

feedly_api is tested under 1.9.3, 2.0.0, 2.1.0, 2.1.1, Ruby HEAD, JRuby (1.9 mode), JRuby HEAD, and Rubinius 2.2.7.

## License

MIT License
