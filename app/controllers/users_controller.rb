class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:request_for_membership]
  before_action :verify_user, only: [:show]
  after_action :verify_authorized, except: [:request_for_membership, :show, :destroy, :approve_disapprove]

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

  private

  def secure_params
    params.require(:user).permit(:role, :tag_list)
  end

  def verify_user
    redirect_to root_path unless (current_user and current_user.has_role? :admin) or (current_user and current_user.id == params[:id].split("-").first.to_i)
  end

end
