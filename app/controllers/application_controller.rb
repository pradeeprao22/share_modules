class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  protect_from_forgery with: :null_session

  # respond_to :json  if api request
  include ActionController::MimeResponds
  rescue_from ActionController::InvalidAuthenticityToken, with: :bad_token

  before_action :configure_permitted_parameters, if: :devise_controller?
  # , only: [:bad_token]

  def encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = decode(token)
      @current_user = Member.find(@decoded[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def bad_token
    flash[:warning] = 'Session expired'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name website bio])
  end
end
