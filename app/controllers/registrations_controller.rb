class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(_resource)
    new_user_session_path
  end

  def update_resource(resource, params)
    if params[:current_password] != ''
      resource.update_without_password(params)
    else
      edit_user_registration_path
      flash[:notice] = 'Please enter your current password'
    end
  end
end
