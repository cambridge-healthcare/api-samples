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

params = {:email => "demo@howareyou.com", :password => "Password1"}
response = access_token.post("/users/authenticate", params)

p JSON.parse(response.body)

# =>
# {
#  "user" => {
#    "id"         => "da0ff676622eaa2faee450b231b322c4",
#    "email"      => "demo@howareyou.com",
#    "first_name" => "demo",
#    "last_name"  => "user",
#    "type"       => "",
#    "creator_id" => ""
#  },
#
#  "consumer_token" => {
#    "key"          => "bf71f03a76e68b10f984797bd3cd3311",
#    "secret"       => "6aa8566be1f0a697b3a2dbb97119cf6d",
#    "user_id"      => "da0ff676622eaa2faee450b231b322c4"
#  }
#}
