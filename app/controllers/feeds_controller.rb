class FeedsController < ApplicationController
    before_action :authenticate_user!
  
  def index
    #if else according to the user activity
    @users = User.all
    @posts = Post.all
  end


  def new

  end

end