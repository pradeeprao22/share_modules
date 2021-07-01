class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user
    validates_presence_of :body, :conversations_id, :user_id
end
