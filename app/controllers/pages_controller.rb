class PagesController < ApplicationController
  include VisitorDetail

  # layout "frontpage"
  def userlanding
    action = params[:action]
    getdetails(action)
    return unless user_signed_in?

    redirect_to posts_path
  end

  def home
    action = params[:action]
    getdetails(action)
    return if user_signed_in?

    redirect_to new_user_session_path
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

  def howto; end

  def innovation; end

  def help; end

  def whyjoinus; end

  def userlandingtesting; end

  def term
    action = params[:action]
    getdetails(action)
  end
end
