module CreateNotification
  extend ActiveSupport::Concern
    def notify(action, post)

      # notification according to user follow
      r = Follow.all.map do |follow|
      
        if follow.follower_id == current_user
          
        end
      
      end

      @notification = Notification.new(:notificationable => post)

      if notification.save!

        ActionCable.server.broadcast 'notification',
        notification: @message.body,

        created: notification.created_at

      head :ok

      end

      created_notification.update(name: action)
    end
end