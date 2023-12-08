class ConversationsController < ApplicationController
  before_action :authenticate_user! # if followed step 2

  def index
    # @users = User.all
    @follows = Follow.all
    @conversations = Conversation.all
    return unless @conversations

    @conversations.map do |conversation|
      conversation.messages.map do |message|
        if message.user != current_user && (message.read == false)
          message.read = true
          message.save!
        end
      end
    end
  end

  def create
    @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                      Conversation.between(params[:sender_id], params[:recipient_id]).first
                    else
                      Conversation.create!(conversation_params)
                    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
