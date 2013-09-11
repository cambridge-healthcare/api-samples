require 'oauth'
require 'json'

CONSUMER_KEY = "6aa8d2199357db6670b03653f35a2e91"
CONSUMER_SECRET = "8fa254320524c355da88df808fc4c25e"

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site         => "https://api.howareyou.com",
)

access_token = OAuth::AccessToken.new(consumer)

#The data field must be a JSON string.
data = JSON.dump("meta_key" => "meta_value")
params = {"data" => data}

# These values are required to decrypt data
# You will have to obtain a new session id and key from the authentication endpoint
headers = {
  "X-CHID-SESSION" => JSON.dump({
    "id"  => "pnduY3LKi1VDU/zFKMFQNJW2Whkuq9girqVCiSQnTTs=",
    "key" => "22E7lsPE44GoIVBNVjPNgWHlfOD6urHpN53Clh7NNUA=",
  }),
}

response = access_token.put("/users/7b33dbb398811023a8512cbda455c0c9/meta_data.json", params, headers)

p JSON.parse(response.body)

# =>
# {
#   "meta_data" => {
#     "user_id" => "da0ff676622eaa2faee450b231b322c4",
#     "data"    => "{\"meta_key\" : \"meta_value\"}"
#   }
# }
