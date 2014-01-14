require 'oauth'
require 'json'

CONSUMER_KEY = "6aa8d2199357db6670b03653f35a2e91"
CONSUMER_SECRET = "8fa254320524c355da88df808fc4c25e"

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site         => "https://api.howareyou.com",
)

# These values are required to decrypt data
# You will have to obtain a new session id and key from the authentication endpoint
headers = {
  "X-CHID-SESSION" => JSON.dump({
    "id"  => "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
    "key" => "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c=",
  }),
}

access_token = OAuth::AccessToken.new(consumer)

response = access_token.get("/users/c5323558d6750f5571655b71ae2a2380", headers)

p JSON.parse(response.body)

# =>
# {
#     "user" => {
#                 "id" => "c5323558d6750f5571655b71ae2a2380",
#              "email" => "demo@howareyou.com",
#         "first_name" => "Demo",
#          "last_name" => "User",
#               "type" => "patient",
#         "patient_id" => "658e810c58653ddf197e13e2fae4cd8a"
#     }
# }
