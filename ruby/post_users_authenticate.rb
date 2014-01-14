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
#                  "id" => "c5323558d6750f5571655b71ae2a2380",
#               "email" => "demo@howareyou.com",
#          "first_name" => "Demo",
#           "last_name" => "User",
#                "type" => "patient",
#          "creator_id" => "",
#          "patient_id" => "658e810c58653ddf197e13e2fae4cd8a"
#   },
#   "consumer_token" => {
#                 "key" => "6aa8d2199357db6670b03653f35a2e91",
#              "secret" => "8fa254320524c355da88df808fc4c25e",
#             "user_id" => "c5323558d6750f5571655b71ae2a2380"
#   },
#   "session" => {
#                  "id" => "pnduY3LKi1VDU/zFKMFQNJW2Whkuq9girqVCiSQnTTs=",
#                 "key" => "22E7lsPE44GoIVBNVjPNgWHlfOD6urHpN53Clh7NNUA=",
#              "expiry" => 1378834967
#   }
# }
