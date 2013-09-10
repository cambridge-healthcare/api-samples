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

# These values are required to decrypt data
# You will have to obtain a new session id and key from the authentication endpoint
headers = {
  "X-CHID-SESSION" => JSON.dump({
    "id"  => "LLX2nNNwDO4YoNeJgocKevNEp2tMhraVOmjLNIZ2ZtA=",
    "key" => "I2HV99QAY3zcvxTkXumUu4JeU+Cs4DcbyRu7LgxoEY4=",
  }),
}

response = access_token.get("/users/7b33dbb398811023a8512cbda455c0c9", headers)

p JSON.parse(response.body)

# =>
# {
#     "user" => {
#                 "id" => "7b33dbb398811023a8512cbda455c0c9",
#              "email" => "demo@howareyou.com",
#         "first_name" => "Demo",
#          "last_name" => "User",
#               "type" => "patient",
#         "creator_id" => "",
#         "patient_id" => "f1dc858d5682c9d76722847399b4bf8e"
#     }
# }
