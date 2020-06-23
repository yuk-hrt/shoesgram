class Shoe < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Shoe.all unless search
    Shoe.where('brand LIKE(?)', "%#{search}%")
  end
end
