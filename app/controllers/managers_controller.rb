class ManagersController < ApplicationController
  before_action :authenticate_manager!

  include AddProvider
  
  def index
    @agents = User.with_role(:agent).where(manager_id: current_user.id)
    @vendors = User.with_role(:vendor).where(manager_id: current_user.id)
  end

  def add_provider
    if request.post?
      create_user

      flash[:notice] = "#{params[:role].humanize} added successfully."
      redirect_to managers_path()
    end
  end

  protected
  def authenticate_manager!
    redirect_to root_path unless current_user and current_user.has_role? :manager
  end
end
