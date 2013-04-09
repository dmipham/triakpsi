class HomeController < ApplicationController
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    
    @users = User.all
    
		@users.each do |user|
      @birthdays = user.first_name+ " " +user.last_name+ " " +user.birthday.strftime("%m/%d") if user.birthday.month == Date.today.month
	
    @new_members = User.find(:all, :order => "id desc", :limit => 5)
  
  	end

  end
end
