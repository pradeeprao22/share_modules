class ApplicationController < ActionController::Base
        #protect_from_forgery with: :exception
        rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token

        before_action :configure_permitted_parameters, if: :devise_controller?

        def bad_token
           flash[:warning] = "Session expired"
           redirect_to root_path
        end

        protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :website, :bio])
        end
end
