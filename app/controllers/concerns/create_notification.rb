module CreateNotification
  extend ActiveSupport::Concern
    def notify(action, post)
      created_notification = Notification.create(:notificationable => post)
      created_notification.update(name: action)
    end
end