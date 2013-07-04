feedly_api
==========

Early unofficial Feedly API

## Usage

```ruby
feedly = FeedlyApi::Client.new 'https://www.eff.org/rss/updates.xml'
=> 
feedly.items
=> [{:id=>
   "55jQyVFBayOwBJQ5qCX8DsgTPumTnzjw6LozTAKPiWA=_13fa6b1134b:1a10f:eacbe387",
  :originId=>"74790 at https://www.eff.org",
  :fingerprint=>"2a5c0169",
  :title=>"Weev's Case Flawed From Beginning to End",
  :published=>1372888846000, 
  # ...
feedly.items(ranked: 'oldest')
=> [{:id=>
   "55jQyVFBayOwBJQ5qCX8DsgTPumTnzjw6LozTAKPiWA=_13f12b61e62:1a2a50:4b1c86ed",
  :originId=>"74409 at https://www.eff.org",
  :fingerprint=>"20f13975",
  :title=>
   "Taiwanese Users Thwart Government Plans to Introduce Internet
Blacklist Law",
  :published=>1370282860000,
  # ...
feedly.items.length
=> 20
feedly.items(count: 50, ranked: 'oldest').length
=> 50
```
