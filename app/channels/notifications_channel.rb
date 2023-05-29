class NotificationsChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'notification'
    end

    def unsubscribed
      stop_all_streams
    end
end