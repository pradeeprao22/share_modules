class PagesController < ApplicationController
  def userlanding
    ip = request.ip
    @visitor_details = VisitornewDetail.create(ip: ip)
    if request.location.city != nil && request.location.country != nil
      @visitor_details.update(city: request.location.city, country: request.location.country)
    end
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

  def success
  end

  def contact_get
    @contact_table = ContactTable.new
  end

  def innovation
  end

  def help
  end

  def term
  end
  
end
