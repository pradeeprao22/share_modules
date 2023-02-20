class CommentsController < ApplicationController
  before_action :authenticate_user!
  # Quick fix
  # skip_before_action :verify_authenticity_token

  def index
    @comments = @post.comments.includes(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # respond_to do |format|
      #   format.js do
      @comment = Comment.find(@comment.id)
      @post = @comment.post
      #   end
      # end
      respond_to :js
      redirect_to post_path(@post.slug)
    else 
      flash[:alert] = "Something went wrong ...."
    end  
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      respond_to :js
    else
      flash[:alert] ="Something went wrong ..."
    end
  end

  private
  def comment_params
    params.required(:comment).permit :user_id, :post_id, :content, :post_slug, :form_authenticity_token
  end
end