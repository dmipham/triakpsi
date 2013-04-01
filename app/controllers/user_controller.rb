class UserController < ApplicationController
  def join
    @new_user = User.new
  end
end
