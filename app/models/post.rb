class Post < ApplicationRecord
  extend FriendlyId

  belongs_to :user

  friendly_id :content, use: [:slugged, :finders]
  validates :content, presence: true
  validates :frontend, presence: true
  validates :frontend_css, presence: true
  with_options dependent: :destroy do |post|
    post.has_many :photos
    post.has_many :likes, -> {order(:created_at => :desc)}
    post.has_many :comments, -> {order(:created_at => :desc)}
    post.has_many :bookmarks
    post.has_many :languages
    post.has_many :tags
    post.has_many :categories
    post.has_many :notifications
    post.has_many :code_files
  end

  has_one :image_repo

  accepts_nested_attributes_for :code_files
  before_create :post_published

  #Backend implementation
  #has_many :columns_for_fake_databases
  #through: :database_tables if self.module_type == "1"

  scope :new_posts, lambda { where("created_at > ?", 1.week.ago) }
  scope :published, lambda { where(published: true) }

  # def module_type post 
  #   if post.module_type == "1" 
  #     puts "BACKEND"
  #   elsif post.module_type == "2"
  #     puts "FRONTEND"
  #   else 
  #     puts "Something went wrong"  
  #   end
  # end
  
  def is_belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end

  def is_liked user
    if user 
    Like.find_by(user_id: user.id, post_id: id)
    end
  end

  def is_bookmarked user
    if user
    Bookmark.find_by(user_id: user.id, post_id: id)
    end
  end

  def self.search(term)
    if term
     where('content LIKE ?', "%#{term}%")
    else
      nil
    end
  end

  # def tags_allocate(tags)
  #   self.tags_id = tags 
  #   self.save!
  # end

  def post_published
    self.published = true
  end
end