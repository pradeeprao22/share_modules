class NotificationChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'notification'
    end
end