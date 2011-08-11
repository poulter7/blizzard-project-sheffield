class UserController < ApplicationController

  def list
    @users = User.find(:all)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
