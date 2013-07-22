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

params = {"values" => "421161003"}
response = access_token.post("/patients/da0ff676622eaa2faee450b231b322c4/medications.json", params)

p JSON.parse(response.body)

# =>
# [
#   {
#     "concept_id" => 421161003,
#     "timestamp"  => 1374500350,
#     "id"         => "1374500350:421161003"
#   }
# ]

