module CreateNotification
    def notify record 
      Notification.create(:notificationable => record)
    end
end