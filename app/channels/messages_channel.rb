class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message'
  end

  def unsubscribed
    stop_all_streams
  end
end
