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

params = {"values" => "421161003"}

# Note that this is the patient_id rather than the user id
# The patient_id must be used for all clinical data interations
response = access_token.post("/patients/f1dc858d5682c9d76722847399b4bf8e/medications.json", params)

p response.body

# =>
#   ""
