class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :allow_params_authentication!, only: :create

  def auth_options
    { scope: resource_name, recall: "Home#index" }
  end

  def create
    if User.exists?(email: sign_up_params["email"])
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      super
    end
  end

  protected
  def update_resource(resource, params)
    if params[:password].present?
      resource.update params
    else
      resource.update_without_password(params)
    end
  end
end