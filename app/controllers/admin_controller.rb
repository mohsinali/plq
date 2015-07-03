class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
  	@agents = User.with_role(:agent)
  	@vendors = User.with_role(:vendor)
  end

  def unapproved
    @providers = User.where(approved: false)
  end

  def add_provider
    if request.post?
      binding.pry
    end
  end

  protected
  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
