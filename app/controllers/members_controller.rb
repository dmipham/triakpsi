class MembersController < ApplicationController
  
  def index
    @members = User.all
    
  end
  
  def edit
    @member = current_user
  end
  
  def update
    @member = current_user
    if @member.update_attributes(params[:user])
     redirect_to member_path
    else
      render 'edit'
    end
  end
  
  def show
    @member = User.find(params[:id])
  end

end
