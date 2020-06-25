class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :shoes
  has_many :comments
  
  has_many :favorites, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # いいねを判断するメソッド
  def already_favorited?(shoe)
    self.favorites.exists?(shoe_id: shoe.id)
  end

  
  #フォローしているかを確認するメソッド
  def following?(user)
    self.following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    self.following_relationships.create(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    self.following_relationships.find_by(following_id: user.id).destroy
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        name:  auth.info.name,
        password: Devise.friendly_token[0, 20],
      )
    end

    user
  end

end
