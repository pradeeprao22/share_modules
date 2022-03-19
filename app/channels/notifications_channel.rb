class NotificationsChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'notification'
    end
end