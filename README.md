feedly_api
==========
[![Coverage Status](https://coveralls.io/repos/Myuzu/feedly_api/badge.png)](https://coveralls.io/r/Myuzu/feedly_api) [![Build Status](https://travis-ci.org/Myuzu/feedly_api.png?branch=master)](https://travis-ci.org/Myuzu/feedly_api) [![Code Climate](https://codeclimate.com/github/Myuzu/feedly_api.png)](https://codeclimate.com/github/Myuzu/feedly_api) [![Dependency Status](https://gemnasium.com/Myuzu/feedly_api.png)](https://gemnasium.com/Myuzu/feedly_api) [![Gem Version](https://badge.fury.io/rb/feedly_api.png)](http://badge.fury.io/rb/feedly_api)

Early unofficial Feedly API with no external dependencies

## Limitations
* no auth for now
* get methods only
* continuation not implemented

## Usage

```ruby
feedly = FeedlyApi::Client.new 
=> #<FeedlyApi::Client:0x007ff233308ae0 @auth_token=nil>
client.get_feed_info 'feed/https://www.eff.org/rss/updates.xml'
=> {:website=>"https://www.eff.org/rss/updates.xml",
 :id=>"feed/https://www.eff.org/rss/updates.xml",
 :subscribers=>2442,
 :title=>"Deeplinks",
 :velocity=>15.2}
client.get_feed_contents 'feed/https://www.eff.org/rss/updates.xml'
=> {:direction=>"ltr",
 :continuation=>"13fa6b1134b:1a10f:eacbe387",
 :alternate=>
  [{:href=>"https://www.eff.org/rss/updates.xml", :type=>"text/html"}],
 :id=>"feed/https://www.eff.org/rss/updates.xml",
 :updated=>1373935361457,
 :title=>"Deeplinks",
 :items=>
  [{:id=> 
  # ...
client.get_feed_contents('feed/https://www.eff.org/rss/updates.xml', count: 1).size
=> 1
```

List of params you can pass to `items` method:
* `ranked`: 'oldest', 'newest'
* `count`: integer, number of feed items to return (1..1000)
* `continuation`: string

## Supported Ruby Versions

feedly_api is tested under 1.9.3, 2.0.0, JRuby (1.9 mode), and Rubinius (1.9 mode).

## License

Apache License, Version 2.0
