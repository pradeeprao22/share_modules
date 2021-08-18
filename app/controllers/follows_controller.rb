class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    user_id = @user.id
    @follow = current_user.follows.new(following_id: user_id)
    if @follow.save
        respond_to :js
    else
        flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @user = @follow.follower
    if @follow.destroy
        respond_to :js
    else
        flash[:alert] = "Something went wrong ...."
    end
  end

  private
  def follows_params
    params.permit :following_id, :follower_id
  end

end