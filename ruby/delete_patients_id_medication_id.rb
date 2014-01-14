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

# Note that this is the patient_id rather than the user id
# The patient_id must be used for all clinical data interations
response = access_token.delete("/patients/658e810c58653ddf197e13e2fae4cd8a/medications/7e0f54c3-98b6-41a8-9e95-06958eebdf2c.json", headers)

# The response body is either empty if no deletion happens
# or {} if it is deleted.
p response.body
