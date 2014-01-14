require 'oauth'
require 'json'

CONSUMER_KEY = "6aa8d2199357db6670b03653f35a2e91"
CONSUMER_SECRET = "8fa254320524c355da88df808fc4c25e"

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
    "id"  => "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
    "key" => "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c=",
  }),
}

access_token = OAuth::AccessToken.new(consumer)

# Note that f1dc85[…] is the patient_id rather than the user_id
# The patient_id must be used for all clinical data interations
response = access_token.get("/patients/658e810c58653ddf197e13e2fae4cd8a/blood_glucose?limit=1", headers)

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
