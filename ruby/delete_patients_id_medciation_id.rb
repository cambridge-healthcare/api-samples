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

response = access_token.delete("/patients/da0ff676622eaa2faee450b231b322c4/medications/421161003.json")

# The response body is either empty if no deletion happens
# or an integer if it is deleted.
p response.body
