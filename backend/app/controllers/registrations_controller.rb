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
      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        redirect_to root_path, alert: resource.errors.full_messages.join(', ')
      end
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
