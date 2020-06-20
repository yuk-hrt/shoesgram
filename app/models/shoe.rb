class Shoe < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy

  def self.search(search)
    return Shoe.all unless search
    Shoe.where('text LIKE(?)', "%#{search}%")
  end
end
