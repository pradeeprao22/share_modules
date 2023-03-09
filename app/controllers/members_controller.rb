class MembersController < ApplicationController
    before_action :authorize_request except: [:create, :index, :show]
    before_action :set_member only: [:show, :update, :destroy]

    def index
      @members = Member.all 
      render json: @members
    end

    def show
       render json: @member
    end

    def create
       @member = Member.new(members_params)
       if @member.save!
        @token = encode({id: @member.id})

       else
        render json: @member
       end
    end

    def update
       if @member
         @member = @member.update(members_params)
         render json: @member
       end 
    end

    def destroy
        @member.destroy
        render json: "Member deleted"
    end

    private
    def set_member
        @member = Memeber.find_by(params[:id])
    end

    def members_params
        params.permit :email, :password
    end
end