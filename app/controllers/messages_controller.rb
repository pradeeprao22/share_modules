class MessagesController < ApplicationController
  include ActionController::Cookies
  before_action :set_cookie, only: [:index]
  
      before_action do
        @conversation = Conversation.find_by_id(params[:conversation_id])
      end
      
      def set_cookie
        cookies[:verified_user] = current_user.id
        verified_user = cookies[:verified_user]
      end

      def index
        @conversations = Conversation.all
        @messages = @conversation.messages
        @message = @conversation.messages.new
      end 

      def messages_index
        @messages = @conversation.messages
        render json: @messages
      end 

      def new
        @message = @conversation.messages.new
      end
      
      def create
        @message = @conversation.messages.new(conversation_id: params[:conversation_id], user_id: params[:message][:user_id], body: params[:message][:body])
        if @message.save
            #message sender
            @user_send = @message.user.id.to_i
            @verified_user = cookies[:verified_user].to_i
            
            #byebug
            if @conversation.sender.id == @verified_user.to_i
               @user_rec = @conversation.recipient.id.to_i
            elsif @conversation.recipient.id == @verified_user.to_i
               @user_rec = @conversation.sender.id.to_i
            else
               flash[:notice] = "Some error"
            end
            #message sent current user
            #@message_sent_user = @conversation.recipient.id

          #byebug
          ActionCable.server.broadcast 'message',
            message: @message.body,
            user_send: @user_send,
            user_rec: @user_rec,
            #user_rec: @user_rec,
            verified_user: @verified_user,
            created: @message.created_at
          head :ok
          # redirect_to conversation_messages_path(@conversation)
          end
      end
      
      private
      def message_params
        params.permit(:body, :user_id, :conversation_id)
      end
end
