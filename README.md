feedly_api
==========
[![Gem Version](https://badge.fury.io/rb/feedly_api.svg)](https://badge.fury.io/rb/feedly_api)
[![Build Status](https://travis-ci.org/Myuzu/feedly_api.svg?branch=master)](https://travis-ci.org/Myuzu/feedly_api)
[![Coverage Status](https://coveralls.io/repos/github/Myuzu/feedly_api/badge.svg?branch=master)](https://coveralls.io/github/Myuzu/feedly_api?branch=master)
[![Code Climate](https://codeclimate.com/github/Myuzu/feedly_api/badges/gpa.svg)](https://codeclimate.com/github/Myuzu/feedly_api)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FMyuzu%2Ffeedly_api.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FMyuzu%2Ffeedly_api?ref=badge_shield)

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

feedly_api is tested under 2.3.7, 2.4.4, 2.5.1, 2.6.0-preview2, Ruby HEAD, JRuby 9.2.0.0.

## License

MIT License


[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FMyuzu%2Ffeedly_api.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FMyuzu%2Ffeedly_api?ref=badge_large)
