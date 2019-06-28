class PagesController < ApplicationController
  def userlanding
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def home
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def about
  end

  def contact
  end

  def innovation
  end

  def help
  end
end
