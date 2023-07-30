class Feed < ApplicationRecord
    belongs_to :user, foreign_key: :user_id, class_name: 'User'
    belongs_to :feedable, polymorphic: true
end