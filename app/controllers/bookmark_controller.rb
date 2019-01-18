class BookmarksController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @bookmark = current_user.bookmark.build(bookmark_params)
      if @bookmark.save
        @post = @bookmark.post
        respond_to :js 
      else 
        flash[:alert] = "Something went..."
      end  
    end
  
    def destroy
      @bookmark = Bookmark.find(params[:id])
      @post = @bookmark.post
      if @bookmark.destroy
        respond_to :js
      else
        flash[:alert] ="Something went wrong ..."
      end
    end
  
    private
    def bookmark_params
      params.permit :user_id, :post_id
    end
  end