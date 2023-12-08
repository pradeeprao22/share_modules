class Notification < ApplicationRecord
  belongs_to :notificationable, polymorphic: true

  def self.current_user_notifications(current_user)
    where(user_id: current_user.id).or(where(reciver_id: current_user.id))
  end
end
