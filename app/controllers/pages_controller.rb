class PagesController < ApplicationController
include VisitorDetail

  def userlanding
    getdetails
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def home
    getdetails
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def about
    getdetails
  end

  def success
    getdetails
  end

  def contact_get
    getdetails
    @contact_table = ContactTable.new
  end

  def innovation
  end

  def help
  end

  def term
    getdetails
  end
  
end
