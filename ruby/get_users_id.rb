require 'oauth'
require 'json'

CONSUMER_KEY = "e4a55dbd46312950cf0d288ff42d74b4"
CONSUMER_SECRET = "b1f8c1c8388ef7c3cd4268ebfb733ba1"

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site         => "https://api.howareyou.com",
)

# These values are required to decrypt data
# You will have to obtain a new session id and key from the authentication endpoint
headers = {
  "X-CHID-SESSION" => JSON.dump({
    "id"  => "DEzQvQE+O+JrgbZtf8+xK7IYuySQTfLMbpHHYx/wyzk=",
    "key" => "+NJmNrd4E5L6t/T37DZKauOGzlQT28ODko72J2T/Vgg=",
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
