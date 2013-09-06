class HomeController < ApplicationController
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    
    @users = User.all
    
	  @users.each do |user|
      @birthdays = user.first_name+ " " +user.last_name+ " " +user.birthday.strftime("%m/%d") if user.birthday.month == Date.today.month
    end
    
    @new_members = User.find(:all, :order => "id desc", :limit => 8)
    
    @jobs = Job.find(:all, :order => "id desc", :limit => 6)
    
    Instagram.configure do |config|
      config.client_id = '7060c6e0ad2c45a1866f2bdffa08ed39'
      config.access_token = '252651791.7060c6e.e99f88deb09943cc9eb0cb9512905e82'
    end
    
    @ig_pics = Instagram.user_recent_media(252651791)
    
    @links = Array.new
    
    @ig_pics.take(5).each do |i|
      link = i[:images][:low_resolution].url
      @links.push(link)
    end

  end
end
