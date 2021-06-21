class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find_by_slug(params[:post_slug])
    post_id = @post.id
    @like = current_user.likes.new(post_id: post_id, post_slug: params[:post_slug])
    if @like.save
        respond_to :js
    else
        flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    if @like.destroy
        respond_to :js
    else
        flash[:alert] = "Something went wrong ...."
    end
  end

  private
  def likes_params
    params.permit :post_id, :post_slug
  end
end