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
    if @contact_table.save
      flash[:alert] = "You details has been submited succesfully we will contact you in 2hrs...."
    else 
      flash[:alert] = "Something went wrong we are working on it...."
    end  
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
