class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :destroy, :build_module]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 9).includes(:photos, :user, :likes, :bookmarks).order('created_at desc')
  end

  def create
        @post = current_user.posts.build(post_params)
        if @post.save
          invoke_cables
            if params[:images]
                params[:images].each do |img|
                  @post.photos.create(image: img)
                end
            end
            # redirect_to posts_path
            respond_to do |format|
              format.html { render "module_post" }
              format.js { render "module_post" }
              # format.json { render json: { message: "Invalid Credentials!" } }
              flash[:notice] = "Your module is saved. Thanks for sharing..."
            end
        else
            flash[:alert] = "Something went wrong ..."
            respond_to :js
            redirect_to posts_path
        end
  end

  def update
     @post = current_user.posts.find_by(slug: params[:slug])
     @post.update(post_params)
     redirect_to posts_path
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = "Post deleted!"
      else
        flash[:notice] = "Something went wrong ..."
      end
     else
      flash[:notice] = "You don't have permission to do that!"
    end
    redirect_to root_path
  end

  def module_post
    @post = Post.new
  end

  def build_module
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
  end

  private

  def find_post
    @post = Post.friendly.find_by_slug(params[:slug])

    return if @post
    flash[:danger] = "Post not exist!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:content, :frontend, :javascript, :backend, :frontend_css, :instruction, :slug)
  end

  def invoke_cables
    CableServices::NotifyJobsService.(
      post: @post,
      action: action_name.to_sym,
      user: current_user
    )
  end
end