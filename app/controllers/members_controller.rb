class MembersController < ApplicationController
  before_action :authorize_request, except: %i[create index show]
  before_action :set_member, only: %i[show update destroy]

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
      @token = encode({ id: @member.id })
      render json: {
        user: @member.attributes.except('password_digest', 'updated_at'),
        token: @token
      }, status: :created
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def update
    return unless @member

    @member = @member.update(members_params)
    render json: @member
  end

  def destroy
    @member.destroy
    render json: 'Member deleted'
  end

  private

  def set_member
    @member = Memeber.find_by(params[:id])
  end

  def members_params
    params.require(:authentication).permit(:email, :password, :name, :bio, :url)
  end
end
