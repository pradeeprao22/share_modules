class PostBroadcastJob < ApplicationJob
    queue_as :default  
  
    def perform(posts)
      ActionCable.server.broadcast 'posts_channel', item: render(posts)  
    end  
  
    private   
      def render(posts)
        ApplicationController.renderer.render(partial: 'posts/posts', locals: {post: posts})  
      end  
end