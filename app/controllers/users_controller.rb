class UsersController < ApplicationController
  def index
    @users = User.by_name
  end

  def show
    @user = User.find(params[:id])
    @lines = @user.repair_services.includes(:service, :repair).newest_first
  end
end
