class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.search(params[:term]).limit(10).order(created_at: :desc)
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    @is_followed = @user.is_followed(current_user)
    @follow = Follow.new(following_id: @user.id, follower_id: current_user.id)
    @posts = @user.posts.paginate(page: params[:page], per_page: 9).includes(:photos, :likes, :comments)
    @bookmarked_posts = @posts.paginate(page: params[:page],
                                        per_page: 9).joins(:bookmarks).where(user_id: current_user.id)
    @liked_posts = @posts.paginate(page: params[:page],
                                   per_page: 9).joins(:likes).where(user_id: current_user.id)
  end

  def likes
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @bookmarked_posts = @posts.paginate(page: params[:page],
                                        per_page: 6).joins(:bookmarks).where(user_id: @user.id)
    @liked_posts = @posts.paginate(page: params[:page], per_page: 6).joins(:likes).where(user_id: @user.id)
  end

  def bookmark
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @liked_posts = @posts.paginate(page: params[:page], per_page: 6).joins(:likes).where(user_id: @user.id)
    @bookmarked_posts = @posts.paginate(page: params[:page],
                                        per_page: 6).joins(:bookmarks).where(user_id: @user.id)
  end
end
