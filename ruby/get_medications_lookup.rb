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
    "id"  => "pnduY3LKi1VDU/zFKMFQNJW2Whkuq9girqVCiSQnTTs=",
    "key" => "22E7lsPE44GoIVBNVjPNgWHlfOD6urHpN53Clh7NNUA=",
  }),
}

access_token = OAuth::AccessToken.new(consumer)

response = access_token.get("/medications/lookup.json?ids=421161003", headers)

p JSON.parse(response.body)

# =>
# [
#     {
#         "snomed_concept_id" => 421161003,
#                      "term" => "Beeswax",
#                  "synonyms" => []
#     }
# ]
