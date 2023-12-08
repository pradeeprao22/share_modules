module MessageModule
  extend ActiveSupport::Concern

  def get_message(user_id)
    @message = Message.find_by(user_id:)
    @message
  end
end
