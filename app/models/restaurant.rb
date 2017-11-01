class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  RESTAURANTS = ["french", "italian", "belgian", "chinese", "japanese"]
  validates :category, inclusion: { in: RESTAURANTS, allow_nil: false }
  validates :name, :address, :category,  presence: true

end

