class UserController < ApplicationController
  def new
    @user = User.new
  end

  def list
    @users = User.find(:all)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user = User.find_by_id(params[:id]).destroy()
    redirect_to users_path
  end

  def block
    @user = User.find_by_id(params[:user_id])
    @user.blocked = !@user.blocked
    @user.save!
    redirect_to users_path
  end

end
