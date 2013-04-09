class DashboardController < ApplicationController
  def index

  end
  
  def directory
      @users = User.all
  end
end
