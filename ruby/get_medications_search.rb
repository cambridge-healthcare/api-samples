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

response = access_token.get("/medications/search.json?term=bees")

p JSON.parse(response.body)

# =>
# [
#     {
#         "snomed_concept_id" => 421161003,
#                      "term" => "Beeswax",
#                  "synonyms" => []
#     }
# ]
