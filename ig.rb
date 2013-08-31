require 'instagram'
require 'json'
require 'net/http'


# All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
Instagram.configure do |config|
  config.client_id = '7060c6e0ad2c45a1866f2bdffa08ed39'
  config.access_token = '252651791.7060c6e.e99f88deb09943cc9eb0cb9512905e82'
end

# Get a list of a user's most recent media
@results = Instagram.user_recent_media(252651791)

@links = Array.new

@results.take(5).each do |i|
  link = i[:images][:low_resolution].url
  @links.push(link)
end


# url = "https://api.instagram.com"
# # client_id = '7060c6e0ad2c45a1866f2bdffa08ed39'
# 
# Instagram.configure do |config|
#   config.client_id = '7060c6e0ad2c45a1866f2bdffa08ed39'
# end
# 
# http = Net::HTTP.new(url)
# request = Net::HTTP::Get.new('/v1/users/self/feed?access_token=252651791.7060c6e.e99f88deb09943cc9eb0cb9512905e82')
# response = http.request(request)
# 
# 
# 
# 
# # get "/feed" do
# #   client = Instagram.client(:client_id)
# #   user = client.user
# # 
# #   html = "<h1>#{user.username}'s recent photos</h1>"
# #   for media_item in client.user_recent_media
# #     html << "<img src='#{media_item.images.thumbnail.url}'>"
# #   end
# #   html
# # end