class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def index
        # Notification should comes from Init
        # Like
        # Bookmark
        @current_user_posts = current_user.posts
        # if @current_user_posts != nil
        #     respond_to do |format|
        #         format.js { render 'create_notifications'} 
        #     end
        # end
        # Notification update through react frontend 
        
        # params user liked your post (user_post)
        # It should be recent
        # This users sent message to you
        @messages_from_user = Message.limit(5).where(user_id: current_user)
    end

end