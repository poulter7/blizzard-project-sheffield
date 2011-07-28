class UserController < ApplicationController

  def list
    @users = User.find(:all)
  end

end
