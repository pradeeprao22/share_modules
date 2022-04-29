class RegistrationsController < Devise::RegistrationsController

  protected

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end