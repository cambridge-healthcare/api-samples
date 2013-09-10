require 'json'
require 'net/https'

params = {'email' => 'demo@howareyou.com', 'password' => 'Password1'}

uri = URI.parse('https://api.howareyou.com/users/authenticate')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

req = Net::HTTP::Post.new(uri.path, params)
req.set_form_data(params)

response = http.request(req)

p JSON.parse(response.body)

# =>
# {
#   "user" => {
#                  "id" => "7b33dbb398811023a8512cbda455c0c9",
#               "email" => "demo@howareyou.com",
#          "first_name" => "Demo",
#           "last_name" => "User",
#                "type" => "patient",
#          "creator_id" => "",
#          "patient_id" => "f1dc858d5682c9d76722847399b4bf8e"
#   },
#   "consumer_token" => {
#                 "key" => "6aa8d2199357db6670b03653f35a2e91",
#              "secret" => "8fa254320524c355da88df808fc4c25e",
#             "user_id" => "7b33dbb398811023a8512cbda455c0c9"
#   },
#   "session" => {
#                  "id" => "LLX2nNNwDO4YoNeJgocKevNEp2tMhraVOmjLNIZ2ZtA=",
#                 "key" => "I2HV99QAY3zcvxTkXumUu4JeU+Cs4DcbyRu7LgxoEY4=",
#              "expiry" => 1378834967
#   }
# }
