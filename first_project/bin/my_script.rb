require 'addressable/uri'
require 'rest-client'
#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
#


# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.json',
# ).to_s
#
# puts RestClient.get(url)

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s

  puts RestClient.delete(
    url,
    { user: {id: 2 } }
  )
end

update_user