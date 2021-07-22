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
        @message = @conversation.messages.new(conversation_id: params[:conversation_id], user_id: params[:message][:user_id], body: params[:message][:body])
        if @message.save
          redirect_to conversation_messages_path(@conversation)
        end
      end
      
      private
      def message_params
        params.permit(:body, :user_id, :conversation_id)
      end
end
