class BookmarksController < ApplicationController
    before_action :authenticate_user!
  
    def create
      post = Post.find_by_slug(params[:post_slug])
      post_id = post.id
      @bookmark = current_user.bookmarks.build(post_id: post_id, post_slug: params[:post_slug])
      if @bookmark.save
        @post = @bookmark.post
        @is_bookmarked = @bookmark
        respond_to :js 
      else 
        flash[:alert] = "Something went wrong..."
      end  
    end
  
    def destroy
      @bookmark = Bookmark.find(params[:id])
      @post = @bookmark.post
      if @bookmark.destroy
        respond_to :js
      else
        flash[:alert] = "Something went wrong ..."
      end
    end
  
    private
    def bookmark_params
      params.permit :user_id, :post_id, :post_slug
    end
  end