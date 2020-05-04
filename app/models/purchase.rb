class Purchase < ApplicationRecord
  belongs_to :garment
  belongs_to :user

  has_one_attached :image
end

