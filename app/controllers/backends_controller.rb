class BackendsController < ApplicationController
    include BackendRunner
    include VisitorDetail
    before_action :authenticate_user!

    def backend_module_post
        if backend_params[:module_type] == "1"
            case
                when backend_params[:database_id] == "1"
                    10.times do # number select by user
                    FakePost.create(description: Faker::Internet.name)
                    end  
                when backend_params[:database_id] == "2"
                    10.times do
                    FakeUser.create(username: Faker::Internet.username)
                    end
                when backend_params[:database_id] == "5"
                    10.times do
                    FakeCategorie.create(name: Faker::Internet.name)
                    end
                when backend_params[:database_id] == "4"
                    10.times do
                    FakeContact.create(email: Faker::Internet.email)  
                    end 
            end
        end

        # For getting user details
        if backend_params 
           action = backend_params[:action]
           getdetails(action)
        end

        if backend_params
           @post = current_user.posts.build(backend_params)
        end

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

    def backend_module
        @post = Post.new
    end

    #under dev
    def backend_module_execution
        code_execute
    end

    private

    def find_post
      @post = Post.friendly.find_by_slug(params[:slug])
  
      return if @post
      flash[:danger] = "Post not exist!"
      redirect_to root_path
    end
  
    def backend_params
      params.require(:post).permit(:content, :frontend, :javascript, :backend, :frontend_css, :database_id, :instruction, :slug, :module_type, :tags_id)
    end
end