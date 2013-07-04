feedly_api
==========

Early unofficial Feedly API

[![Build Status](https://travis-ci.org/Myuzu/feedly_api.png?branch=master)](https://travis-ci.org/Myuzu/feedly_api)

## Limitations
* no auth for now
* only feed stats and feed items
* continuation not implemented

## Usage

```ruby
feedly = FeedlyApi::Client.new 
=> #<FeedlyApi::Client:0xb91fed0c @auth_token=nil>
feed = feedly.feed 'https://www.eff.org/rss/updates.xml'
=> #<FeedlyApi::Feed:0xb90aef38
 @subscribers=2348,
 @title="Deeplinks",
 @url="https://www.eff.org/rss/updates.xml",
 @velocity=15.2>
feed.items
=> [{:id=>
   "55jQyVFBayOwBJQ5qCX8DsgTPumTnzjw6LozTAKPiWA=_13fa6b1134b:1a10f:eacbe387",
  :originId=>"74790 at https://www.eff.org",
  :fingerprint=>"2a5c0169",
  :title=>"Weev's Case Flawed From Beginning to End",
  :published=>1372888846000, 
  # ...
feed.items(ranked: 'oldest')
=> [{:id=>
   "55jQyVFBayOwBJQ5qCX8DsgTPumTnzjw6LozTAKPiWA=_13f12b61e62:1a2a50:4b1c86ed",
  :originId=>"74409 at https://www.eff.org",
  :fingerprint=>"20f13975",
  :title=>
   "Taiwanese Users Thwart Government Plans to Introduce Internet
Blacklist Law",
  :published=>1370282860000,
  # ...
feed.items.length
=> 20
feed.items(count: 50, ranked: 'oldest').length
=> 50
```

List of params you can pass to `items` method:
* `ranked`: 'oldest', 'newest'
* `count`: integer, number of feed items to return (1..1000)
* `continuation`: string
* maybe some other params...

## License

Apache License, Version 2.0
