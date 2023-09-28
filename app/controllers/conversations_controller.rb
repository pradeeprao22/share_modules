class ConversationsController < ApplicationController
    before_action :authenticate_user! # if followed step 2
  
  def index
    # @users = User.all
    @follows = Follow.all
    @conversations = Conversation.all
    if @conversations
      @conversations.map do |conversation|
        conversation.messages.map do |message|
          if message.user != current_user
            if message.read == false
              message.read = true
              message.save!
            end
          end
        end
      end
    end
  end
  
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present? 
       @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
       @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
