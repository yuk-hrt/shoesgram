class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shoes
  has_many :comments

  has_many :favorites, dependent: :destroy

  # いいねを判断するメソッド
  def already_favorited?(shoe)
    self.favorites.exists?(shoe_id: shoe.id)
  end
end
