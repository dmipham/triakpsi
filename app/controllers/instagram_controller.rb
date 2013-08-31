require 'instagram'

URL = "http://api.instagram.com"

Instagram.configure do |config|
  config.client_id = 7060c6e0ad2c45a1866f2bdffa08ed39
end

get "/feed" do
  client = Instagram.client(:client_id => session[:client_id])
  user = client.user

  html = "<h1>#{user.username}'s recent photos</h1>"
  for media_item in client.user_recent_media
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
end