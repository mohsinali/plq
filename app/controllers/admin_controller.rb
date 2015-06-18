class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :desc)
  end

  protected
  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
