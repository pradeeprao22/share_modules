class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: {maximum: 50}

  def self.search(term)
     if term
      where('name LIKE ?', "%#{term}%")
     else
       nil
     end
  end
end
