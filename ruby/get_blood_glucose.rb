require 'oauth'
require 'json'

CONSUMER_KEY = "6aa8d2199357db6670b03653f35a2e91"
CONSUMER_SECRET = "8fa254320524c355da88df808fc4c25e"
PATIENT_ID = "f1dc858d5682c9d76722847399b4bf8e"

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site         => "https://api.howareyou.com",
  :http_method  => :get,
)

# These values are required to decrypt data
# You will have to obtain a new session id and key from the authentication endpoint
headers = {
  "X-CHID-SESSION" => JSON.dump({
    "id"  => "pnduY3LKi1VDU/zFKMFQNJW2Whkuq9girqVCiSQnTTs=",
    "key" => "22E7lsPE44GoIVBNVjPNgWHlfOD6urHpN53Clh7NNUA=",
  }),
}

access_token = OAuth::AccessToken.new(consumer)

response = access_token.get("/patients/#{PATIENT_ID}/blood_glucose?limit=1", headers)

p JSON.parse(response.body)

# =>
#
# [
#     {
#             "value" => 5.0,
#         "timestamp" => 1378894473,
#              "unit" => "mmol/L",
#                "id" => "1378894473:50",
#              "type" => "Serum"
#     }
# ]