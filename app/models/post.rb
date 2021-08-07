class Post < ApplicationRecord
  extend FriendlyId

  belongs_to :user

  friendly_id :content, use: [:slugged, :finders]
  validates :content, presence: true

  has_many :photos, dependent: :destroy
  has_many :likes, -> {order(:created_at => :desc)}, dependent: :destroy
  has_many :comments, -> {order(:created_at => :desc)}, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one :language, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, dependent: :destroy

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