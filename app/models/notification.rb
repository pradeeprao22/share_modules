class Notification < ApplicationRecord
    belongs_to :notificationable, polymorphic: true
end