class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
prepend_before_filter :allow_params_authentication!, :only => :create
prepend_before_filter { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    
    if warden.authenticate(auth_options).nil?
      @resource = nil
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      
      yield resource if block_given?
      # respond_with resource, location: after_sign_in_path_for(resource)
      @resource = resource      
    end
    respond_to :html, :js
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
