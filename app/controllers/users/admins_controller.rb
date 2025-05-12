# app/controllers/users/admins_controller.rb
class Users::AdminsController < ApplicationController
  before_action :check_admin

  def approve
  	debugger
    @user = User.find(params[:id])
    @user.add_role(:author)
    redirect_to root_path, notice: "User approved!"
  end

  def decline
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User declined!'
  end

  private
  def check_admin
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: 'Not authorized.'
    end
  end
end