module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # include ActionController::Cookies

    # if current_user
    #   cookies[:verified_user] = current_user.id
    #   verified_user = cookies[:verified_user]
    # end

    # identified_by :current_user

    # def connect
    #   self.current_user = find_verified_user
    # end

    # private
    # def find_verified_user # this checks whether a user is authenticated with devise
    #   if verified_user = verified_user
    #     verified_user
    #   else
    #     reject_unauthorized_connection
    #   end
    # end

  end
end
