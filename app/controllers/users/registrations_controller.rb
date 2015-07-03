class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    
    resource.save

    yield resource if block_given?
    if resource.persisted?
      ## #####################################
      ## Assign a role to newly created user
      resource.add_role params[:role]
      
      # Add Selected services
      params[:user_service].each do |service|
        UserService.create(name: service, user_id: resource.id)
      end

      # Add Selected cities
      params[:user_cities].each do |city|
        UserCity.create(name: city, user_id: resource.id)
      end
      
      ## ########################
      ## Upload Profile Image      
      resource.image = params[:user][:image]

      ## #####################################
      ## Assign interests
      resource.interest_list.add(params[:interests], parse: true)
      resource.save

      @resource = resource

      ## ########################
      ## Notify Admin
      notify_admin()
      
      flash[:notice] = "You have signed up successfully but your account has not been approved by your administrator yet."
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        # respond_with resource, location: after_sign_up_path_for(resource)
        @resource = resource
        respond_to :js
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
        @resource = resource
        respond_to :js
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      # respond_with resource
      @resource = resource
      respond_to :js
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :location, :service, :tier, :country, :social_links, :description, :image, :email, :password, :password_confirmation)
    end
    
  end

  def notify_admin    
    UserMailer.notify_admin(@resource).deliver
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:name, :location, {:user_service_ids => []}, {:user_city_ids => []}, :tier, :country, :social_links, :description, :image, :email, :password, :password_confirmation, :current_password)
  #   end
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
