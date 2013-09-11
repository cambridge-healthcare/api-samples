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

access_token = OAuth::AccessToken.new(consumer, headers)

# Note that this is the patient_id rather than the user id
# The patient_id must be used for all clinical data interations
response = access_token.delete("/patients/f1dc858d5682c9d76722847399b4bf8e/medications/421161003.json")

# The response body is either empty if no deletion happens
# or an integer if it is deleted.
p response.body
