class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def create_notifications
        # Notification should comes from Init
        # Like
        # Bookmark

        @current_user_posts = current_user.posts

        # Notification update through react frontend 
        
        # params user liked your post (user_post)
    end

end