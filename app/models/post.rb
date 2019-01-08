class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  has_many :photos, dependent: :destroy
end
