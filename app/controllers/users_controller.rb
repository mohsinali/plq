class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:request_for_membership]
  before_action :verify_user, only: [:show]
  after_action :verify_authorized, except: [:request_for_membership, :show, :destroy, :approve_disapprove, :user_services, :user_languages, :user_cities, :user_countries, :upload_image]

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.js
    end
  end

  def request_for_membership
    UserMailer.request_for_membership(params).deliver
    flash[:notice] = "Your membership request has been received."

    respond_to :js
  end

  def approve_disapprove
    user = User.find(params[:id])
    user.approve_disapprove
    
    msg = { :status => 200, :message => "Success!", :approved => user.approved ? "Yes" : "No" }
    render :json => msg
  end

  def user_services
    @user_services = User.services
    respond_to do |format|
      format.html
      format.json { render :json =>  @user_services.map{ |m| {m => m} }.to_json}
    end
  end

  def user_languages
    @user_languages = Language.all
    respond_to do |format|
      format.html
      format.json { render :json =>  @user_languages.map{ |m| {m.name => m.name} }.to_json}
    end
  end

  def user_cities
    @user_cities = User.cities
    respond_to do |format|
      format.html
      format.json { render :json =>  @user_cities.map{ |m| {m => m} }.to_json}
    end
  end

  def user_countries
    countries = Country.all
    respond_to do |format|
      format.html
      format.json { render :json =>  countries.map{ |m| {m.name => m.name} }.to_json}
    end
  end

  def upload_image
    user = User.find(params[:id])
    unless params[:user].nil?
      user.image = params[:user][:image]
      user.save!
    end
    redirect_to user_path(user)
  end

  def contact_agent
    
  end

  private

  def secure_params
    params.require(:user).permit(:role, :tag_list)
  end

  def provider_is_added_by_manager(user_id)
    user = User.find(user_id)
    if user.manager_id == current_user.id
      return true
    else
      return false
    end    
  end

  def verify_user
    redirect_to root_path unless (current_user and current_user.has_role? :admin) or (current_user and current_user.id == params[:id].split("-").first.to_i) or (current_user and current_user.has_role? :manager and provider_is_added_by_manager(params[:id].split("-").first.to_i))
  end

end
