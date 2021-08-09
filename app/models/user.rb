class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_many :follows, foreign_key: :follower_id, class_name: 'Follow'
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true

  def is_followed user
    User.find_by(id: user.id, id: id)
  end

  def self.search(term)
     if term
      where('content LIKE ?', "%#{term}%")
     else
       nil
     end
  end
end
