require 'oauth'
require 'json'

CONSUMER_KEY = "bf71f03a76e68b10f984797bd3cd3311"
CONSUMER_SECRET = "6aa8566be1f0a697b3a2dbb97119cf6d"

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site         => "https://api.howareyou.com",
)

access_token = OAuth::AccessToken.new(consumer)

response = access_token.get("/medications/lookup.json?ids=421161003")

p JSON.parse(response.body)

# =>
# [
#   {
#     "id"   => 421161003,
#     "term" => "Beeswax"
#   }
# ]
