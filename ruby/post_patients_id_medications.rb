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

params = {"concept_id" => "421161003", "started_at" => "2014-01-13T12:24:29+00:00"}

access_token = OAuth::AccessToken.new(consumer)

# Note that this is the patient_id rather than the user id
# The patient_id must be used for all clinical data interations
response = access_token.post("/patients/658e810c58653ddf197e13e2fae4cd8a/medications.json", params, headers)

p response.body

# =>
# {
#     "id" => "7e0f54c3-98b6-41a8-9e95-06958eebdf2c"
# }
