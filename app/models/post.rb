class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  has_many :photos, dependent: :destroy
  has_many :likes, -> {order(:created_at => :desc)}
  has_many :comments, -> {order(:created_at => :desc)}
  has_many :bookmarks
  has_one :language

  def is_belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end

  def is_liked user
    Like.find_by(user_id: user.id, post_id: id)
  end

  def is_bookmarked user
    Bookmark.find_by(user_id: user.id, post_id: id)
  end
end