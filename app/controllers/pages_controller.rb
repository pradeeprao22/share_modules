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

  def contact_table
      @contact_table = ContactTable.new(contact_table_params)
      @contact_table.save
  end

  def innovation
  end

  def help
  end

  private
  def contact_table_params
    params.permit(:name, :number, :phonenumber, :message)
  end
end
