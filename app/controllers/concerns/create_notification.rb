module CreateNotification
  extend ActiveSupport::Concern
    def notify record 
      Notification.create(:notificationable => record)
    end
end