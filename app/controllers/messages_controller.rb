class MessagesController < ApplicationController
    before_action do
        @conversation = Conversation.find_by_id(params[:conversation_id])
      end
      
      def index
        @messages = @conversation.messages
        @message = @conversation.messages.new
      end
      def new
        @message = @conversation.messages.new
      end
      def create
        @message = @conversation.messages.new(conversations_id: params[:conversation_id], user_id: params[:user_id])
        if @message.save
          redirect_to conversation_message_path(@conversation)
        end
      end
      private
      def message_params
        params.permit(:body, :user_id, :conversations_id)
      end
end
