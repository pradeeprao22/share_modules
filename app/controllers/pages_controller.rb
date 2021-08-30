class PagesController < ApplicationController
include VisitorDetail

  def userlanding
    action = params[:action]
    getdetails(action)
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def home
    action = params[:action]
    getdetails(action)
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def about
    action = params[:action]
    getdetails(action)
  end

  def success
    action = params[:action]
    getdetails(action)
  end

  def contact_get
    action = params[:action]
    getdetails(action)
    @contact_table = ContactTable.new
  end

  def howto 
  end

  def innovation
  end

  def help
  end

  def term
    action = params[:action]
    getdetails(action)
  end
  
end
