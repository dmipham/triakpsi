class UsersController < ApplicationController
  def join
    @new_user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
       flash[:success] = "Thanks for joining!"
       redirect_to root_path
     else
         render '/join'
       end
  end
  
end
