class PagesController < ApplicationController
  def userlanding
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
