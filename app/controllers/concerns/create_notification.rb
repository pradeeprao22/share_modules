module CreateNotification
  extend ActiveSupport::Concern
    def fetch_follow
          # notification according to user follow
          result = Follow.all.map do |follow|
            if follow.follower_id == current_user
                user  = follow.following_id
            elsif follow.following_id == current_user 
                user = follow.follower_id
            else
              puts "ERROR: UNABLE TO FETCH USER"   
            end
          end  
    end
    
    def notify(action, model)
      #fetch_follow.user
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

        byebug

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
        @notification.update(name: action, user_id: current_user.id, notify_message: @message)

        ActionCable.server.broadcast 'notification',
          notification: @notification.id,
          created: @notification.created_at,
          message: @notification.notify_message,
          user: current_user
      end
    end
end