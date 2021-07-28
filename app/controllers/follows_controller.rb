class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @follow = Follow.new(follower_id: params[:follow][:follower_id], following_id: params[:follow][:following_id])
    if @follow.save!
      flash[:alert] = "You have succesfully followed this user"
    end
  end

  private
  def follows_params
    params.permit :following_id, :follower_id
  end

end