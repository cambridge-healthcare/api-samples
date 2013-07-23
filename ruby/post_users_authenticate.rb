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
#  "user" => {
#    "id"         => "da0ff676622eaa2faee450b231b322c4",
#    "email"      => "demo@howareyou.com",
#    "first_name" => "demo",
#    "last_name"  => "user",
#    "type"       => "",
#    "creator_id" => ""
#  },
#
#  "consumer_token" => {
#    "key"          => "bf71f03a76e68b10f984797bd3cd3311",
#    "secret"       => "6aa8566be1f0a697b3a2dbb97119cf6d",
#    "user_id"      => "da0ff676622eaa2faee450b231b322c4"
#  }
#}
