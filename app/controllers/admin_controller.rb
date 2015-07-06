class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  include AddProvider

  def index
  	@agents = User.with_role(:agent)
  	@vendors = User.with_role(:vendor)
    @managers = User.with_role(:manager)
  end

  def unapproved
    @providers = User.where(approved: false)
  end

  def add_provider
    if request.post?
      create_user

      flash[:notice] = "#{params[:role].humanize} added successfully."
      redirect_to admin_index_path()
    end
  end

  protected
  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
