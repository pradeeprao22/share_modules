class Member < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :bookmarks
end
