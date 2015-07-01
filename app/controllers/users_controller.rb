class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:request_for_membership]
  after_action :verify_authorized, except: [:request_for_membership, :show, :approve_disapprove]

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
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
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

end
