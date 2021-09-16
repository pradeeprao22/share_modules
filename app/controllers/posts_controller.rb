class PostsController < ApplicationController
  include BackendRunner
  include VisitorDetail
  before_action :authenticate_user!, only: [:show, :destroy, :create, :module_post]
  before_action :find_post, only: [:show, :destroy, :build_module]

  def index
    # For getting user details
    action = params[:action]
    getdetails(action)

    @posts = Post.paginate(:page => params[:page], :per_page => 9).includes(:photos, :user, :likes, :bookmarks).order('created_at desc')
    # redirect_to posts_path
    respond_to do |format|
      format.js {render layout: false}
      format.html { render 'index'} 
    end
  end

  def create
    # request from module_post.html.erb will come here
    # Accroding to the cases tables will be created
    if post_params[:module_type] == "1"
      case
      when post_params[:database_id] == "1"
        10.times do # number select by user
          FakePost.create(description: Faker::Internet.name)
        end  
      when post_params[:database_id] == "2"
        10.times do
          FakeUser.create(username: Faker::Internet.username)
        end
      when post_params[:database_id] == "5"
        10.times do
          FakeCategorie.create(name: Faker::Internet.name)
        end
      when post_params[:database_id] == "4"
        10.times do
          FakeContact.create(email: Faker::Internet.email)  
        end 
      end
    end
        # For getting user details
        action = params[:action]
        getdetails(action)

        @post = current_user.posts.build(post_params)
        if @post.save
            if params[:images]
                params[:images].each do |img|
                  @post.photos.create(image: img)
                  # ActionCable.server.broadcast('post_channel', post: ( render @post))
                  if @post.module_type == "1"
                    redirect_to new_columns_for_fake_databases_path
                  else
                    flash[:notice] = "Post submitted success now create columns for you backend module.."
                  end
                  # head :ok
                  # PostBroadcastJob.perform_later
                  # As soon as post get created colmuns table creation will get called
                  # Under development
                  # As soon as it create it will start building build
                  # redirect_to building_path(@post.slug)
                  # PostBroadcastJob.perform_later
                end
            end
            # respond_to do |format|
            #   format.js
            # end
        else
            flash[:alert] = "Something went wrong ..."
            respond_to :js
            redirect_to posts_path
        end
  end

  def update
    # for getting user details
    action = params[:action]
    getdetails(action)

     @post = current_user.posts.find_by(slug: params[:slug])
     @post.update(post_params)
     redirect_to post_path
     flash[:notice] = "Module updated succesfully."
  end

  def show
    # for getting user details
    action = params[:action]
    getdetails(action)

    @photos = @post.photos
    @post = @post
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
  end

  def destroy
    # for getting user details
    action = params[:action]
    getdetails(action)

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
    # if params[:database_table_id].present?
    #   @module_type = DatabaseTable.find(database_table_id).module_type
    # else
    #   @module_types = ModuleType.all
    # end

    # if request.xhr?
    #   respond_to do |format|
    #     format.json {
    #       render json: {module_types: @module_types}
    #     }
    #   end
    # end
    @post = Post.new
  end

  #under dev backend module for execution
  # def backend_module_execution
  #   code_execute
  # end

  def build_module
    # for getting user details
    action = params[:action]
    getdetails(action)

    #under dev
    if @post.module_type == "1"
      get_backend_code(@post.id)
    end

    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
    @fake_user = FakeUser.all
    @fake_contact = FakeContact.all
    @fake_categorie = FakeCategorie.all
    @fake_post = FakePost.all
    # under dev
    # post_id = @post.id
    # backend_module_execution(post_id)
  end

  #under dev
  def import_module
    post = @post

    # In Dev
    @import = Import.create(import_client: params[:import_client], user_id: current_user.id, post_id: @post.id)
  end

  private

  def find_post
    @post = Post.friendly.find_by_slug(params[:slug])

    return if @post
    flash[:danger] = "Post not exist!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:content, :frontend, :javascript, :backend, :frontend_css, :database_id, :instruction, :slug, :module_type)
  end

end