class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true

  def self.search(term)
     if term
      where('name LIKE ?', "%#{term}%")
     else
       nil
     end
  end
end
