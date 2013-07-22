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

response = access_token.get("/users/da0ff676622eaa2faee450b231b322c4")

p JSON.parse(response.body)

# =>
# {
#   "user" => {
#     "id"         => "da0ff676622eaa2faee450b231b322c4",
#     "email"      => "demo@howareyou.com",
#     "first_name" => "demo",
#     "last_name"  => "user",
#     "type"       => "",
#     "creator_id" => ""
#   }
# }
