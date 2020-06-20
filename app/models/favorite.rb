class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

  # 一つしかいいねできないバリデーション
  validates_uniqueness_of :shoe_id, scope: :user_id
end
