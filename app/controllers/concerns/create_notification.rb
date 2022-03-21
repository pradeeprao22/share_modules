module CreateNotification
  extend ActiveSupport::Concern

    def notify(action, model)
      @notification = Notification.new(:notificationable => model)
      if @notification.save!
        ###Notification Triggers
        #Post
        #Bookmark
        #Like
        #Follow
        #Message
        #Comment
        #Tag
        #Notification Reciver 
        #Notification Sender

        case
          when @notification.notificationable_type == "Post"
              @message = "#{@notification.notificationable.user.name} posted new code module: #{@notification.notificationable.content}"
          when @notification.notificationable_type == "Bookmark"
              @message = "#{@notification.notificationable.user.name} bookmarked new code module: #{@notification.notificationable.post.content}"
          when @notification.notificationable_type == "Like"
              @message = "#{@notification.notificationable.user.name} liked new code module: #{@notification.notificationable.post.content}"
          when @notification.notificationable_type == "Follow"
              @message = "#{@notification.notificationable.user.name} started following: #{@notification.user.name}"
          when @notification.notificationable_type == "Message"
              @message = "#{@notification.notificationable.user.name} sent a message to: #{@notification.notificationable.conversation.recipient.name}"
        end

        # Stroing message generated
        # User who triggered the notification

        # Notification According to User Followed
        Follow.all.map do |follow|
          if follow.follower_id == current_user.id
              @notify_user = follow.following_id
              #Create Multiple Notification
              @notification.update(name: action, user_id: current_user.id, reciver_id: @notify_user, notify_message: @message)
            elsif follow.following_id == current_user.id
              @notify_user = follow.follower_id
              #Create Multiple Notification
              @notification.update(name: action, user_id: current_user.id, reciver_id: @notify_user, notify_message: @message)
            else
              puts "ERROR: UNABLE TO FETCH USER"   
            end
        end   

        ActionCable.server.broadcast 'notification',
          notification: @notification.id,
          created: @notification.created_at,
          message: @notification.notify_message,
          user: current_user
      end
    end
end