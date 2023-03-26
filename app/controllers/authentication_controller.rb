class AuthenticationController < ApplicationController
before_action :authorize_request, except: [:login]

    def login
     @member = Member.find_by(email: login_params[:email])
     if @member.authenticate(login_params[:password])
        token = encode({id: @member.id})
        render json: {
          user: @member.attributes.except("password_digest"),
          token: token
          }, status: :ok
       else
        render json: { errors: 'unauthorized' }, status: :unauthorized
     end
    end

    # GET /auth/verify
    def verify
        render json: @current_user.attributes.except("password_digest"), status: :ok
    end

    private
    
    def login_params
        params.require(:authentication).permit(:email, :password)
    end

end