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

#The data field must be a JSON string.
data = JSON.dump("meta_key" => "meta_value")
params = {"data" => data}

response = access_token.put("/users/da0ff676622eaa2faee450b231b322c4/meta_data.json", params)

p JSON.parse(response.body)

# =>
# {
#   "meta_data" => {
#     "user_id" => "da0ff676622eaa2faee450b231b322c4",
#     "data"    => "{\"meta_key\" : \"meta_value\"}"
#   }
# }
